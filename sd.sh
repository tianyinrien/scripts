#!/bin/bash
cp ~/scripts/emacs.el .emacs
#echo -e "(exwm-config-default)\n(setq exwm-workspace-number 1)" >> .emacs
sleep 1
startx ~/.xinitrc dwm
