#!/usr/bin/env bash

# delete existing dotifles and create dotfiles symlinks with Stow
install_dotfiles() {
    local PACKAGES=$@
    for PACKAGE in $PACKAGES; do
        CONFLICTS=$(stow -nv -t $HOME $PACKAGE 2>&1 | awk '/\* existing target is/ {print $NF}')
        if [[ ! -z ${CONFLICTS} ]]; then
            for FILENAME in ${CONFLICTS[@]}; do
                if [[ -f $HOME/$FILENAME || -L $HOME/$FILENAME ]]; then
                    echo "DELETE: $FILENAME"
                    rm -f "$HOME/$FILENAME"
                fi
            done
        fi

        stow -v -D -t $HOME $PACKAGE
        stow -v -t $HOME $PACKAGE 

    done
}

# delete dotfiles symlinks created by Stow
clean_dotifles() {
    local PACKAGES=$@
    for PACKAGE in $PACKAGES; do
        stow -v -D -t $HOME $PACKAGE
    done
}

install_vim_plug() {
    # check if vim-plug is already installed
    if [[ -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]]; then
        echo "Vim-plug is already installed. No changes were made."
    else
        echo "Installing vim-plug for Neovim..."
        curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        nvim +PlugInstall +qall
    fi
}

## main

PACKAGES=( $(for i in $(ls -d */); do echo ${i%/}; done) )
NVIM_PACKAGE=nvim

case "$1" in
    install-dotfiles)
        install_dotfiles ${PACKAGES[@]}
        ;;
    clean-dotfiles)
        clean_dotifles ${PACKAGES[@]}
        ;;
    install-vim-plug)
        install_vim_plug
        stow -v -t $HOME $NVIM_PACKAGE
        ;;
    *)
        echo "Invalid option"
        exit 1
esac
