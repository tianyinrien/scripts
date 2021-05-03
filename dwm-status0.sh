#!/bin/bash
pkill dwm-status.sh
while true
do
	bash ~/scripts/dwm-status-refresh0.sh
	sleep 1 
done
