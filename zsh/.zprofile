if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  export MOZ_ENABLE_WAYLAND=1
  export MOZ_DBUS_REMOTE=1
  export GTK_CSD=0
  export XDG_CURRENT_DESKTOP=sway
  export XDG_SESSION_DESKTOP=sway
  export EDITOR=nvim
  export QT_QPA_PLATFORM="wayland;xcb"
  export QT_QPA_PLATFORMTHEME=qt5ct
  export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
  export JAVA_AWT_WM_NONREPARENTING=1
#  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
  
  exec sway
fi
