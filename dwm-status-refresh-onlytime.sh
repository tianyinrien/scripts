#!/bin/bash

print_date(){
#  date=$(date '+%m-%d %H:%M')
   date=$(date '+%H:%M')
#    echo -e " $date"
   echo "$date"
}

xsetroot -name " $(print_date) "

exit 0
