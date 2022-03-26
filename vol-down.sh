#!/bin/bash

amixer -c 1 -qM set Master 5%- umute
#pactl set-sink-volume 0 -5%

#pactl set-sink-volume @DEFAULT_SINK@ -5%
bash ~/scripts/dwm-status-refresh.sh
