#!/usr/bin/env bash
# Description: Toggles laptop display on/off
# Author: Ary Kleinerman

# Laptop monitor name
LAPTOP_MONITOR="eDP-1"

# Check if laptop display is enabled
hyprctl monitors | grep $LAPTOP_MONITOR > /dev/null 2>&1
IS_ENABLED=$?

# Toggle laptop display
if [ $IS_ENABLED -eq 0 ]; then
    # Disable laptop display
    hyprctl keyword monitor "eDP-1, disable" > /dev/null 2>&1
    echo "disabled"
else
    # Enable laptop display
    hyprctl keyword monitor "$(grep -e ^monitor=eDP-1 .config/hypr/hyprland.conf | cut -d'=' -f2)" > /dev/null 2>&1
    echo "enabled"
fi
