#!/bin/bash
stest -flx /usr/bin/ /usr/local/bin | dmenu -h 80 -l 19 -p Run: -fn "Agave Nerd Font:size=16" -nb "#333333" -nf "#999999" -sb "#999999" -sf "#222222" | sort -u | ${SHELL:-"/bin/sh "} &
#dmenu_run -l 10 -p Run: -fn "Agave Nerd Font:size=18" -x 500 -y 500 -w 1500 -nb "#202020" -nf "#bbbbbb" -sb "#ffffff" -sf "#222222"
