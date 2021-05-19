#!/bin/bash
colors="-nb #2C323E -nf #9899a0 -sb #81A1C1 -sf #E5E9F0"
colors1="-nb #deb887 -nf #000000 -sb #ffe4b5 -sf #303030" 

#sel=$(find ~/Documents -maxdepth 20 -type f | grep -Eo "Documents*.pdf" | dmenu -i -p Books: -l 23 -fn "Agave Nerd Font:size=16" $colors1  )
sel=$(find ~/Documents -maxdepth 20 -type f | dmenu -i -p Books: -l 23 -fn "Agave Nerd Font:size=16" $colors1  )
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

