#!/bin/bash

sel=$(find ~/ -maxdepth 20 -type f | dmenu -i -p Open: -l 23 -fn "Agave Nerd Font:size=16")

if [ -n "$sel" ]
then
   pr=$(stest -flx /usr/bin/ /usr/local/bin | dmenu -l 19 -p Run: -fn "Agave Nerd Font:size=16")
fi

if [ -n "$pr" ] 
then
    $pr $sel
fi



# case $tp in
#     tex)    emacs $sel ;;
#     conf)   emacs $sel ;;
#     pdf)  zathura $sel ;;
#     sh)     emacs $sel ;;
#     mkv)      vlc $sel ;;
#     mp4)      vlc $sel ;;
# esac
