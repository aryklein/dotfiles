if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
  exec Hyprland
fi
