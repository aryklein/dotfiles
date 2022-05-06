#!/usr/bin/env bash

STOW_ZSH_PACKAGE=zsh
ZSH_PATH=/usr/bin/zsh
ZSH_POWELEVEL10K_PKG=zsh-theme-powerlevel10k-git
ZSH_PLUGINS=(
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

# do not run as root
if [[ $EUID -eq 0 ]]; then
   echo "ERROR: this script must not be run with root permissions."
   exit 1
fi

# Check if zsh is installed in the system
if ! which zsh > /dev/null 2>&1; then
    echo "ERROR: zsh shell is not installed."
    exit 1
fi

# check if powerlevel10k is installed
if ! pacman -Qi $ZSH_POWELEVEL10K_PKG > /dev/null 2>&1; then
    echo "ERROR: this setup needs '$ZSH_POWELEVEL10K_PKG' (from AUR) installed."
    exit 1
fi

# install zshrc dotfile and install plugins
if [[ -f ${HOME}/.zshrc ]]; then
    read -r -p "There is an existing zsh config. Do you want to override it? [y/N]: " RESPONSE
    if [[ ! $RESPONSE =~ ^(y|Y|yes|Yes)$ ]]; then
        echo "No changes were made. Bye!"
        exit 0
    else
        rm -rfv ${HOME}/.zshrc ${HOME}/.p10k.zsh
    fi
fi

# stow zshrc file 
stow -v -t $HOME $STOW_ZSH_PACKAGE

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

# check recommended plugins
for ZSH_PLUGIN in ${ZSH_PLUGINS[@]}; do
    if ! pacman -Qi $ZSH_PLUGIN> /dev/null 2>&1; then
        echo "INFO: consider installing '$ZSH_PLUGIN' for a better experience."
    fi
done

