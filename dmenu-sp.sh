#!/bin/bash

cmd=$(echo -e "poweroff\nreboot" | dmenu -i -p "Execute:" -l 20 -fn "Agave Nerd Font:size=16")

if [ -z "$cmd" ]
then
    exit 0
fi

case "$cmd" in
    poweroff)
	sudo poweroff ;;
    reboot)
	sudo reboot ;;
    low-energy)
        sudo cpupower frequency-set governor conservative ;;
esac
