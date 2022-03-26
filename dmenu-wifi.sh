#!/bin/bash

sel=$(echo -e "oneplus\ncnu\nhome\nwpa-off\niw-off" | dmenu -i -p "Which WiFi to be connected?" -l 20)

if [ -z "$sel" ]
then
    exit 0
fi

sudo pkill wpa_supplicant && sudo iw dev wlan0 disconnect

case "$sel" in
    oneplus)
           sudo pkill wpa_supplicant 
           sudo wpa_supplicant -i wlan0 -c ~/scripts/oneplus.conf -B ;;
       home)
	   sudo pkill wpa_supplicant
	   sudo wpa_supplicant -i wlan0 -c ~/scripts/home.conf -B ;;
       cnu)
	   sudo iw dev wlan0 disconnect
	   sudo iw dev wlan0 connect CNU ;;
    wpa-off)
	   sudo pkill wpa_supplicant ;;
    iw-off)
	   sudo iw dev wlan0 disconnect ;;
esac

exit 0
