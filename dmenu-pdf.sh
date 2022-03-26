#!/bin/bash

#sel=$(find ~/Documents -maxdepth 20 -type f | grep -Eo "Documents*.pdf" | dmenu -i -p Books: -l 23 -fn "Agave Nerd Font:size=16" $colors1  )
sel=$(find ~/ownCloud/Documents -maxdepth 20 -type f | sed -r 's/\/.*\///'| dmenu -i -p Books: -l 23 )
path=$(find ~/ownCloud/Documents -maxdepth 20 -type f | grep $sel)

if [ -z "$sel" ]
then
    exit 0
fi

#text="$(echo -e $sel | sed -r 's/\ +/\\ /g')"
tp=$(echo $sel | sed 's/.*\.//')
#n1=$(xdotool search --class tabbed)

# open_file() {
#         zathura "$path" &
#         sleep 0.8
# 	n2=$(xdotool getwindowfocus)
# }

#barl=$(echo -e "tabbed\nnon-tabbed" | dmenu -i -p Tabbed? -l 5)

if [[ $tp == pdf || $tp == djvu ]]
then
#    if [ $barl == tabbed ]
#    then
	# if [ -z $n1 ]
        # then
#	   tabbed -c zathura "$path" -e &
    #     else
    # 	   open_file
    # 	   xdotool windowreparent $n2 $n1
    #     fi
    # else
    # 	zathura "$path" &
#    fi
    
   zathura $path
   
fi

exit 0

