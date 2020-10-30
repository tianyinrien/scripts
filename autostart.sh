#!/bin/bash

/bin/bash ~/scripts/dwm-status.sh &
/bin/bash ~/scripts/wp-autochange.sh &
picom -b
#picom -o 0.95 -i 0.95 --detect-rounded-corners --vsync --blur-background-fixed -f -D 3 -c -b
#feh --bg-scale ~/Pictures/457319.jpg
clipmenud &






