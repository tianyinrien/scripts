#!/bin/bash
# Screenshot: http://s.natalian.org/2013-08-17/dwm_status.png
# Network speed stuff stolen from http://linuxclues.blogspot.sg/2009/11/shell-script-show-network-speed.html

# This function parses /proc/net/dev file searching for a line containing $interface data.
# Within that line, the first and ninth numbers after ':' are respectively the received and transmited bytes.



print_disk() {
  disk=$(lsblk -f | grep sda4 | awk '{print $5}')
  echo -e "$disk"
}

print_mem(){
   memfree=$(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}')
   mem=$(echo "scale=2; $memfree/1024/1024" | bc)
   echo "${mem}G"
}

print_bat(){
  precent=$(acpi -b | grep 'Battery\ 0' | awk '{print $4}' | grep -Eo "[0-9]+")
	echo -e "${precent}%"
}

print_date(){
   date=$(date '+%H:%M')
   echo "$date"
}

print_cpuinfo(){
   tep=$(sensors | grep Package | awk '{print $4}')
   hzm=$(lscpu | grep CPU\ MHz | awk '{print $3}')
   hzg=$(echo "scale=2; $hzm/1024" | bc | awk '{printf "%.2f",$0}')
   echo -e "${hzg}GHz $tep"
}

echo -e " | $(print_mem) | $(print_cpuinfo) | "

exit 0
