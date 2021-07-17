#!/bin/bash

print_bat(){
    precent=$(acpi -b | grep 'Battery\ 0' | awk '{print $4}' | grep -Eo "[0-9]+")
    just=$(acpi -b | grep 'Battery\ 0' | awk '{print $3}' | grep -Eo "[A-Za-z]+")
    #	echo -e " ${precent}%"
    if [ $just == "Charging" ]
    then
	echo -e "+${precent}%"
    else
	echo -e "${precent}%"
    fi
    }

print_date(){
#  date=$(date '+%m-%d %H:%M')
   date=$(date '+%H:%M')
#    echo -e " $date"
   echo "$date"
}

xsetroot -name " $(print_bat) "

exit 0
