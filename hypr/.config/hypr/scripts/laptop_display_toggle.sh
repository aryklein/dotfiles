#!/bin/bash

# This script toggles the hyprland monitor
# The script will get as argument the name of the monitor to toggle

if [[  $# -ne 1 ]]; then
    echo "Usage: $0 <monitor_name>"
    exit 1
fi


# List of embedded displays (laptop screens) and external displays
ALL_MONITORS=$(hyprctl monitors all| grep Monitor | awk '{print $2}')
ENABLED_MONITORS=$(hyprctl monitors | grep Monitor | awk '{print $2}')

if echo "${ALL_MONITORS}" | grep -q "^${1}$"; then
    echo "Toggling monitor: $1"
else
    echo "Monitor $1 not found"
    exit 1
fi

# Check if the monitor name provided as argument is enabled
if echo "${ENABLED_MONITORS}" | grep -q "^${1}$"; then
    CURRENT_STATUS=$(hyprctl monitors -j | jq -r ".[] | select(.name==\"$1\") | \"$1,preferred,\(.x)x\(.y),\(.scale),transform,\(.transform)\"")
    echo $CURRENT_STATUS > /tmp/monitor_status_$1.txt
    hyprctl keyword monitor "$1, disable"
else
    read CURRENT_STATUS < /tmp/monitor_status_$1.txt
    hyprctl keyword monitor "$CURRENT_STATUS"
    # Remove the temporary file
    if [[ -f /tmp/monitor_status_$1.txt ]]; then
        rm /tmp/monitor_status_$1.txt
    fi
fi
