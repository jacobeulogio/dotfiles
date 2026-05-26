#!/usr/bin/env bash
# --- Configuration ---
# Change these to match your actual monitor names.
# Run `hyprctl monitors` to find them.
LAPTOP_MONITOR="eDP-2"
EXTERNAL_MONITOR="HDMI-A-1"

# --- Logic ---
#
# Get list of currently connected monitor names
connected=$(hyprctl monitors | grep "^Monitor" | awk '{print $2}')
# Check if external monitor is present
if echo "$connected" | grep -q "^${EXTERNAL_MONITOR}$"; then
    # External monitor connected -> disable laptop screen
    echo "Docked: disabling ${LAPTOP_MONITOR}"
    hyprctl keyword monitor "${LAPTOP_MONITOR},disable"
else
    # External monitor disconnected -> enable laptop screen
    echo "Undocked: enabling ${LAPTOP_MONITOR}"
    hyprctl keyword monitor "${LAPTOP_MONITOR},preferred,auto,1"
fi
