#!/bin/bash
export QT_QPA_PLATFORMTHEME="qt5ct"
stest -flx /usr/bin/ /usr/local/bin | dmenu -l 19 -p Run: | /bin/zsh &
#dmenu_run -l 10 -p Run: -fn "Agave Nerd Font:size=18" -x 500 -y 500 -w 1500 -nb "#202020" -nf "#bbbbbb" -sb "#ffffff" -sf "#222222"
