#! /bin/sh

name=$(ps -u ren ax | awk '{print $5 $6}' | grep -E "^\zathura" | sed -r 's/^\zathura.*\///' | dmenu -i -p Name: -l 20)

xdotool windowactivate --sync $(xdotool search --name $name)





