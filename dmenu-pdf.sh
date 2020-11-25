#!/bin/bash
colors="-nb #2C323E -nf #9899a0 -sb #81A1C1 -sf #E5E9F0"
colors1="-nb "#333333" -nf "#999999" -sb "#999999" -sf "#222222" "

sel=$(find ~/ -maxdepth 20 -type f | dmenu -i -l 22  -x 25 -y 100 -w 2500 -h 60 -fn "Agave Nerd Font:size=16" $colors  )

tp=$(echo $sel | sed 's/.*\.//')
if [[ $tp == pdf ]]; then
     zathura $sel
fi
#if [[ ! -z $sel ]]; then
#   prp=$(echo -e "zathura\nnvim\n" | dmenu -i -l 2 -x 700 -y 500 -w 1000 -fn "Agave Nerd Font:size=16" )
#  if [[ $prp == zathura ]]; then
#     zathura $sel
#  else
#      nvim $sel
#  fi
#fi
exit 0

