#!/bin/bash

/bin/bash ~/scripts/dwm-status.sh &
#/bin/bash ~/scripts/wp-autochange.sh &
color=$(grep 'appearance' ~/src/dwm/config.h | awk '{print $2}')

case "$color" in
    appearance-dark)
        feh --bg-scale ~/Pictures/black.jpg ;;
    appearance-green)
	feh --bg-scale ~/Pictures/green.jpg ;;
    appearance-orange)
        feh --bg-scale ~/Pictures/orange.jpg ;;
esac


#picom -o 0.9 -i 0.01 -I 0.01 &       
#v2ray -c ~/config.json &
xbacklight -set 10 &

#fcitx5 &
clipmenud &
toggle=$(amixer -c 1 get Master | tail -n1 | awk '{print $6}')
 
if [ $toggle == "[on]" ]
then 
amixer -c 1 sset Master toggle
fi

