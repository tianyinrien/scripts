#!/bin/bash

cp ~/scripts/dwm-green.h ~/src/dwm/config.h
cd ~/src/dwm/
sudo make clean install

cp ~/scripts/dm-green.h ~/src/dmenu/config.h
cd ~/src/dmenu/
sudo make clean install

cp ~/scripts/st-green.h ~/src/st/config.h
cd ~/src/st/
sudo make clean install

cp ~/scripts/zathurarc.green ~/.config/zathura/zathurarc

cp ~/scripts/autoconfig.yml.green ~/.config/qutebrowser/autoconfig.yml

echo "well done!!"
