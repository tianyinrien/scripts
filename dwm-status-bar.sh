#!/bin/bash

cmd=$(echo -e "battery-time\nonly-time\nsystem-info" | dmenu -i -p "Choose-Bar:" -l 20)

if [ -z "$cmd" ]
then
    exit 0
fi

case "$cmd" in
    battery-time)
	cp ~/scripts/dwm-status-refresh-bat-time.sh ~/scripts/dwm-status-refresh.sh ;;
    system-info)
	cp ~/scripts/dwm-status-refresh-sys.sh ~/scripts/dwm-status-refresh.sh ;;
    only-time)
	cp ~/scripts/dwm-status-refresh-onlytime.sh ~/scripts/dwm-status-refresh.sh ;;
esac
