#!/bin/bash         

sel=$(find ~/scripts -maxdepth 20 -type f | dmenu -i -p Script: -l 23 )


if [ -n "$sel" ] 
then
    bash $sel
fi


