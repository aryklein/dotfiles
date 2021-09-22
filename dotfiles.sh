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

## main
# do not run as root or with sudo
if [[ $EUID -eq 0 ]]; then
   echo "Error: you must not be root to run this script."
   exit 1
fi

PACKAGES=( $(for i in $(ls -d */); do echo ${i%/}; done) )

case "$1" in
    install)
        install_dotfiles ${PACKAGES[@]}
        ;;
    clean)
        clean_dotifles ${PACKAGES[@]}
        ;;
    *)
        echo "Usage: $0 [install|clean]"
esac
