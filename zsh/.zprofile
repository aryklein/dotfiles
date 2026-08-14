if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#  eval $(gnome-keyring-daemon --start)
#  export SSH_AUTH_SOCK
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
  exec start-hyprland
fi
