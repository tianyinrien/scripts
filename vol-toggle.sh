#!/bin/bash

amixer -c 1 sset Bass\ Speaker toggle && amixer -c 1 sset Master toggle && amixer -c 1 sset Speaker toggle
#/usr/bin/amixer -c 1 set Master mute
#pactl set-sink-mute 0 toggle

bash ~/scripts/dwm-status-refresh.sh
