#!/bin/bash
sel=$(find ~/ -maxdepth 20 -type f | dmenu -i -p Open: -l 23 -fn "Agave Nerd Font:size=16")

if [ -n "$sel" ]
then
emacs $sel
fi
