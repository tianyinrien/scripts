#!/bin/bash

cmd=$(echo -e "only-battery\nonly-times\nsystem-info" | dmenu -i -p "Choose-Bar:" -l 20 -fn "Agave Nerd Font:size=16")

if [ -z "$cmd" ]
then
    exit 0
fi

case "$cmd" in
    only-battery)
	cp ~/scripts/dwm-status-refresh-simple.sh ~/scripts/dwm-status-refresh.sh ;;
    system-info)
	cp ~/scripts/dwm-status-refresh-sys.sh ~/scripts/dwm-status-refresh.sh ;;
    only-times)
	cp ~/scripts/dwm-status-refresh-nobat.sh ~/scripts/dwm-status-refresh.sh ;;
esac
