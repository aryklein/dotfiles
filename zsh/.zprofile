if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
<<<<<<< Updated upstream

  exec sway
=======
  exec Hyprland
>>>>>>> Stashed changes
fi
