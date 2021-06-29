#!/bin/bash

/bin/bash ~/scripts/dwm-status.sh &
#/bin/bash ~/scripts/wp-autochange.sh &
feh --bg-scale ~/ll/1759286.png  
#picom -o 0.02 -i 0.01 -I 0.01 &       
#v2ray -c ~/config.json &
xbacklight -set 10 &

#fcitx5 &
clipmenud &
toggle=$(amixer -c 1 get Master | tail -n1 | awk '{print $6}')
 
if [ $toggle == "[on]" ]
then 
amixer -c 1 sset Master toggle
fi

