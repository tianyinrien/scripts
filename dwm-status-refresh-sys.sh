#!/bin/bash

# functions
print_volume() {
    volume="$(amixer -c 1 get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
    status="$(amixer -c 1 get Master | tail -n1 | awk '{print $6}')"
      if [ "$volume" -gt 0 ] && [ "$status" == "[on]" ]
      then
         echo -e "${volume}%"
      else
         echo -e "M"
      fi
}


print_backlight() {
    light="$(xbacklight | grep -Eo "^.*\.")"
    echo "scale=0; ${light}" | bc
}


print_disk() {
    disk=$(lsblk -f | grep sda5 | awk '{print $5}' | sed -r 's/G$//')
    echo -e "${disk}G"
}


print_mem() {
   memfree=$(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}')
   mem=$(echo "scale=2; $memfree/1024/1024" | bc)
   #   echo " ${mem}G"
   echo "${mem}G"

}


print_bat() {
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


print_date() {
  date=$(date '+%m-%d %H:%M')
#   date=$(date '+%H:%M')
#    echo -e " $date"
   echo "$date"
}


print_cpuinfo() {
### show temp by using sensors
   tep0=$(sensors | grep Core\ 0: | awk '{print $3}' | grep -Eo "[0-9.]+")
   tep1=$(sensors | grep Core\ 1: | awk '{print $3}' | grep -Eo "[0-9.]+")
   #   hzm=$(lscpu | grep CPU\ MHz | awk '{print $3}')
   tep=$(echo "scale=1; ($tep0+$tep1)/2" | bc)

### show CPU frequence using lscpu
     mg0=$(lscpu -a --extended | grep "0    0      0" | awk '{print $9}')
     mg1=$(lscpu -a --extended | grep "1    0      0" | awk '{print $9}')
     mg2=$(lscpu -a --extended | grep "2    0      0" | awk '{print $9}')
     mg3=$(lscpu -a --extended | grep "3    0      0" | awk '{print $9}')
     mg=$(echo "($mg0+$mg1+$mg2+$mg3)/4" | bc)
     zg=$(echo "scale=2; $mg/1024" | bc | awk '{printf "%.2f",$0}')   

      co=$(sensors | grep Core\ 1: | awk '{print $3}' | grep -Eo "[^+0-9.]+")
      echo -e "${zg}GHz +$tep$co"
}


print_wifi() {
    wifi=$(iw dev wlan0 info | grep ssid | awk '{print $2}')
    if [ -z "$wifi" ]
    then
	echo -e "H"
    else
    	echo -e "W"
    fi
    }


# print result
monitor=$(xrandr | grep "HDMI2" | awk '{print $2}')

if [ $monitor == connected ]; then
	xsetroot -name " $(print_wifi)  $(print_disk)  $(print_cpuinfo)  $(print_mem)  $(print_bat)  $(print_date) "
else
        xsetroot -name "  $(print_volume)  $(print_backlight)  $(print_wifi)  $(print_disk)  $(print_cpuinfo)  $(print_mem)  $(print_bat)  $(print_date) " 
fi

exit 0
