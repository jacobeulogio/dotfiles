#!/bin/bash

if [ "$XDG_SESSION_TYPE"  = "wayland" ]; then
  nm-applet &
  way-displays &
  else
    picom &
    xrandr --output HDMI-2 --primary --mode 1920x1080 --rate 60.00 --output DP-1 --mode 1920x1080 --rate 60.00 --left-of HDMI-2 &
fi

