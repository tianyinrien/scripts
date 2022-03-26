#!/bin/bash

cmd=$(echo -e "poweroff\nreboot\nlow-energy\nmed-energy\nhig-energy" | dmenu -i -p "Execute:" -l 20 )

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
        sudo cpupower frequency-set --governor conservative ;;
    med-energy)
        sudo cpupower frequency-set --governor ondemand ;;
    hig-energy)
        sudo cpupower frequency-set --governor performance ;;

esac
