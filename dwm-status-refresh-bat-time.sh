#!/bin/bash

# functions

print_bat(){
    precent=$(acpi -b | grep 'Battery\ 0' | awk '{print $4}' | grep -Eo "[0-9]+")
    just=$(acpi -b | grep 'Battery\ 0' | awk '{print $3}' | grep -Eo "[A-Za-z]+")
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
   echo "$date"
}

    xsetroot -name " $(print_bat)  $(print_date) "

exit 0
