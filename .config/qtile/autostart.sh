#!/bin/bash

nm-applet &
way-displays &
picom &
xrandr --output HDMI-2 --primary --mode 1920x1080 --rate 60.00 --output DP-1 --mode 1920x1080 --rate 60.00 --left-of HDMI-2
