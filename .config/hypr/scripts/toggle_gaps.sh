#!/usr/bin/env sh

HYPR_GAPS=$(hyprctl getoption general:gaps_out | awk '/custom type:/ { if ($3 > 0) print 1; else print 0 }')
if [ "$HYPR_GAPS" -eq 0 ] ; then
    hyprctl --batch "\
        keyword decoration:shadow:enabled 0;\
        keyword general:gaps_in 4;\
        keyword general:gaps_out 8;\
        keyword general:border_size 2;\
        keyword decoration:rounding 10"
    exit
fi

hyprctl reload

