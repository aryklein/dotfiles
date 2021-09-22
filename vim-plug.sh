#!/usr/bin/env bash

NVIM_PACKAGE=nvim

install_vim_plug() {
    # check if vim-plug is already installed
    if [[ -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]]; then
        echo "Vim-plug is already installed. No changes were made."
        exit 0
    else
        echo "Installing vim-plug for Neovim..."
        curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        nvim +PlugInstall +qall
    fi
}

# do not run as root or with sudo
if [[ $EUID -eq 0 ]]; then
   echo "Error: you must not be root to run this script."
   exit 1
fi

# check if curl and neovim are installed
if ! (command -v curl > /dev/null && command -v nvim > /dev/null); then
    echo "Error: this script needs curl and neovim to run."
    exit 1
fi

case "$1" in
    install)
        # install vim-plug for neovim
        install_vim_plug
        # stow neovim dotfile
        stow -v -t $HOME $NVIM_PACKAGE
        # install all plugins defined in the neovim config file
        nvim +PlugInstall +qall
        ;;

    upgrade)
        # upgrade vim-plug
        nvim +PlugUpgrade +qall
        ;;

    clean)
        # remove vim-plug
        rm "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
        ;;

    update-plugins)
        # install or update plugins
        nvim +PlugUpdate +qall
        ;;

    clean-plugins)
        # remove unlisted plugins
        nvim +PlugClean! +qall
        ;;

    *)
        echo "Usage: $0 [install|upgrade|clean|update-plugins|clean-plugins]"
        ;;
esac

