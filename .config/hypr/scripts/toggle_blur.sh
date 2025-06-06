#!/usr/bin/env sh

HYPR_BLUR=$(hyprctl getoption decoration:blur:enabled | awk 'NR==1{print $2}' )
if [ "$HYPR_BLUR" -gt 0 ] ; then
    hyprctl --batch "\
        keyword decoration:blur:enabled 0;\
        keyword decoration:inactive_opacity 1"
    exit
fi

hyprctl reload


