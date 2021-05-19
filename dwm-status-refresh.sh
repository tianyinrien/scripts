#!/bin/bash
# Screenshot: http://s.natalian.org/2013-08-17/dwm_status.png
# Network speed stuff stolen from http://linuxclues.blogspot.sg/2009/11/shell-script-show-network-speed.html

# This function parses /proc/net/dev file searching for a line containing $interface data.
# Within that line, the first and ninth numbers after ':' are respectively the received and transmited bytes.

print_volume() {
	volume="$(amixer -c 1 get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
	if test "$volume" -gt 0
	then
		echo -e "  ${volume}"
	else
		echo -e "M"
	fi
}

print_disk() {
  disk=$(lsblk -f | grep sda4 | awk '{print $5}')
  #  echo -e " $disk"
  echo -e "$disk"
}

print_mem(){
   memfree=$(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}')
   mem=$(echo "scale=2; $memfree/1024/1024" | bc)
   #   echo " ${mem}G"
   echo "${mem}G"

}

print_bat(){
  precent=$(acpi -b | grep 'Battery\ 0' | awk '{print $4}' | grep -Eo "[0-9]+")
  #	echo -e " ${precent}%"
  echo -e "${precent}%"
}

print_date(){
#  date=$(date '+%m-%d %a %H:%M')
   date=$(date '+%H:%M')
#    echo -e " $date"
   echo "$date"
}

print_cpuinfo(){
   tep0=$(sensors | grep Core\ 0: | awk '{print $3}' | grep -Eo "[0-9.]+")
   tep1=$(sensors | grep Core\ 1: | awk '{print $3}' | grep -Eo "[0-9.]+")
   hzm=$(lscpu | grep CPU\ MHz | awk '{print $3}')
   hzg=$(echo "scale=2; $hzm/1024" | bc | awk '{printf "%.2f",$0}')
   tep=$(echo "scale=1; ($tep0+$tep1)/2" | bc)
    co=$(sensors | grep Core\ 1: | awk '{print $3}' | grep -Eo "[^+0-9.]+")
   echo -e "${hzg}GHz +$tep$co"
}

xsetroot -name "  $(print_disk)  $(print_cpuinfo)  $(print_mem)  $(print_bat)  $(print_date) "

exit 0
