#!/usr/bin/env bash

set -euo pipefail

# delete existing dotfiles and create dotfiles symlinks with Stow
install_dotfiles() {
    local packages=("$@")
    local package stow_output stow_status filename
    local conflicts=()

    for package in "${packages[@]}"; do
        stow_status=0
        stow_output=$(stow -nv -t "$HOME" "$package" 2>&1) || stow_status=$?
        mapfile -t conflicts < <(
            awk '
                /\* existing target is/ { print $NF; next }
                /\* cannot stow .* over existing target / {
                    sub(/^.* over existing target /, "")
                    sub(/ since .*$/, "")
                    print
                }
            ' <<<"$stow_output"
        )

        if (( stow_status != 0 && ${#conflicts[@]} == 0 )); then
            printf '%s\n' "$stow_output" >&2
            return "$stow_status"
        fi

        if (( ${#conflicts[@]} > 0 )); then
            for filename in "${conflicts[@]}"; do
                if [[ -f "$HOME/$filename" || -L "$HOME/$filename" ]]; then
                    echo "DELETE: $filename"
                    rm -f "$HOME/$filename"
                fi
            done
        fi

        stow -v -D -t "$HOME" "$package"
        stow -v -t "$HOME" "$package"
    done
}

# delete dotfiles symlinks created by Stow
clean_dotfiles() {
    local packages=("$@")
    local package

    for package in "${packages[@]}"; do
        stow -v -D -t "$HOME" "$package"
    done
}

# do not run as root or with sudo
if [[ $EUID -eq 0 ]]; then
    echo "Error: you must not be root to run this script."
    exit 1
fi

if ! command -v stow >/dev/null 2>&1; then
    echo "Error: GNU Stow is required but was not found in PATH."
    exit 1
fi

# environment definition
PACKAGES=(
    alacritty
    atuin
    audacity
    backgrounds
    bash
    bat
    brave
    chromium
    elephant
    electron
    flameshot
    fontconfig
    fuzzel
    fzf
    git
    gtk
    hypr
    k9s
    kitty
    mako
    nvim
    obsproject
    paru
    pcmanfm
    slack
    spotify
    ssh
    starship
    swappy
    tfswitch
    tgswitch
    tmux
    walker
    waybar
    wob
    wofi
    zsh
    opencode
)

case "$1" in
    install)
        install_dotfiles "${PACKAGES[@]}"
        ;;
    clean)
        clean_dotfiles "${PACKAGES[@]}"
        ;;
    *)
        echo "Usage: $0 [install|clean]"
        exit 1
esac
