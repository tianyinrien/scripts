#!/bin/bash

cp ~/scripts/dwm-dark.h ~/src/dwm/config.h
cd ~/src/dwm/
sudo make clean install

cp ~/scripts/dm-dark.h ~/src/dmenu/config.h
cd ~/src/dmenu/
sudo make clean install

cp ~/scripts/st-dark.h ~/src/st/config.h
cd ~/src/st/
sudo make clean install

cp ~/scripts/zathurarc.dark ~/.config/zathura/zathurarc

cp ~/scripts/autoconfig.yml.dark ~/.config/qutebrowser/autoconfig.yml

echo "well done!!"
