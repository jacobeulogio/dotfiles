#!/usr/bin/env bash

# === Config ===
MONITOR_NAME="eDP-2"       # Replace with actual monitor name from `hyprctl monitors`
RESOLUTION="1920x1200"
REFRESH_1="60"
REFRESH_2="165"

# === Get current refresh rate ===
CURRENT_REFRESH=$(hyprctl monitors | grep -A5 "$MONITOR_NAME" | sed -n 's/.*@\([0-9]\{2,3\}\).*/\1/p')

# === Determine target refresh rate ===
if [ "$CURRENT_REFRESH" -eq "$REFRESH_1" ]; then
    NEW_REFRESH=$REFRESH_2
else
    NEW_REFRESH=$REFRESH_1
fi

# === Switch refresh rate ===
hyprctl keyword monitor $MONITOR_NAME,${RESOLUTION}@${NEW_REFRESH},1920x0,1

notify-send "Hyprland" "$MONITOR_NAME set to ${NEW_REFRESH}Hz"
