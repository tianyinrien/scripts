#!/bin/bash

/bin/bash ~/scripts/dwm-status.sh &
#/bin/bash ~/scripts/wp-autochange.sh &

# color=$(grep 'appearance' ~/src/dwm/config.h | awk '{print $2}')

# case "$color" in
#     appearance-dark)
# #	picom -O 0.02 -I 0.02 -D 20 -r 30 --experimental-backends &
#     appearance-green)
# 	feh --bg-scale ~/Pictures/green.jpg ;;
#     appearance-orange)
#         feh --bg-scale ~/Pictures/orange.jpg ;;
# esac
feh --bg-fill ~/scripts/wallpapers/aenami_3.jpg

sudo cpupower frequency-set --governor conservative 

sudo bash ~/scripts/wakeup.sh &
#picom -o 0.9 -i 0.01 -I 0.01 &       
xbacklight -set 15 &
xss-lock --transfer-sleep-lock -- i3lock -c 000000 --nofork &
xautolock -time 10 -locker "i3lock -c 000000" &
clipmenud &
pulseaudio &
toggle=$(amixer -c 1 get Master | tail -n1 | awk '{print $6}')
 
if [ $toggle == "[on]" ]
then 
amixer -c 1 sset Master toggle
fi

#/bin/bash ~/scripts/fcitx5.sh &
