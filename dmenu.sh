#!/bin/bash
colors1="-nb #deb887 -nf #000000 -sb #ffe4b5 -sf #303030"
stest -flx /usr/bin/ /usr/local/bin | dmenu -l 19 -p Run: -fn "Agave Nerd Font:size=16" | sort -u | ${SHELL:-"/bin/sh "} &
#dmenu_run -l 10 -p Run: -fn "Agave Nerd Font:size=18" -x 500 -y 500 -w 1500 -nb "#202020" -nf "#bbbbbb" -sb "#ffffff" -sf "#222222"
