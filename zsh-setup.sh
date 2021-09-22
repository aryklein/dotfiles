#!/usr/bin/env bash

ZSH_PLUGINS_DIR=$HOME/.zsh/plugins
ZSH_PACKAGE=zsh
ZSH_PLUGINS=(
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

# install zshrc dotfile and install plugins
setup() {
    if [[ -f ${HOME}/.zshrc ]]; then
        read -r -p "There is an existing zsh config. Do you want to override it? [y/N]: " RESPONSE
        if [[ ! $RESPONSE =~ ^(y|Y|yes|Yes)$ ]]; then
            echo "No changes were made. Bye!"
            exit 0
        else
            if [[ -h ${HOME}/.zshrc ]]; then
                rm ${HOME}/.zshrc
            else
                mv ${HOME}/.zshrc ${HOME}/.zshrc.bak
                echo "INFO: .zshrc saved as .zshrc.bak"
            fi
        fi
    fi
        
    # stow zshrc file 
    stow -v -t $HOME $ZSH_PACKAGE
    
    # install necesary plugins
    echo "Installing git-prompt plugin..."
    mkdir -p $ZSH_PLUGINS_DIR 2>/dev/null
    git clone --depth=1 https://github.com/woefe/git-prompt.zsh $ZSH_PLUGINS_DIR/git-prompt.zsh 2>/dev/null
    
    # change the login shell by ZSH
    ZSH_PATH=$(which zsh)
    if [[ $SHELL != $ZSH_PATH ]]; then
        read -r -p "Login shell is not zsh. Do you want to set zsh as default login shell? [Y/n]: " RESPONSE
        if [[ $RESPONSE =~ ^(y|Y|yes|)$ ]]; then
            chsh -s $(which zsh) $USER
        else
            echo "Login shell did not change."
        fi
    fi
    
    for ZSH_PLUGIN in ${ZSH_PLUGINS[@]}; do
        if ! pacman -Qi $ZSH_PLUGIN> /dev/null 2>&1; then
            echo "INFO: consider installing '$ZSH_PLUGIN' for a better experience."
        fi
    done
}

update() {
    if find $HOME/.zsh/plugins -maxdepth 2 -name .git -type d > /dev/null; then
        find $HOME/.zsh/plugins -maxdepth 2 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} git -C {} pull origin master
    else
        echo "Error: no plugins found. Aborting."
        exit 1
    fi
}

remove() {
    if [[ -f $HOME/.zshrc ]]; then
        echo "Removing .zshrc file..."
        rm -f $HOME/.zshrc
    fi

    if [[ -d $ZSH_PLUGINS_DIR ]]; then
        echo "Removing plugins..."
        rm -rf $ZSH_PLUGINS_DIR
    fi
}

# do not run as root
if [[ $EUID -eq 0 ]]; then
   echo "This script must not be run as root"
   exit 1
fi

# Check if zsh is installed in the system
if ! which zsh > /dev/null 2>&1; then
    echo "Error: zsh shell is not installed."
    exit 1
fi

# main function
case $1 in
    setup) 
        echo Setup zsh...
        setup
        ;;
    update) 
        echo Update zsh plugins...
        update
        ;;
    remove) 
        echo Remove zsh setup and plugins...
        remove
        ;;
    *)  echo "Usage: $0 [setup|update|remove]"
        echo "- setup: setup zsh config and install plugins."
        echo "- update: update all zsh plugins."
        echo "- remove: remove zsh setup and all plugins installed thru this script."
        ;;
esac

