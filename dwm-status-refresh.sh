#!/bin/bash
# Screenshot: http://s.natalian.org/2013-08-17/dwm_status.png
# Network speed stuff stolen from http://linuxclues.blogspot.sg/2009/11/shell-script-show-network-speed.html

# This function parses /proc/net/dev file searching for a line containing $interface data.
# Within that line, the first and ninth numbers after ':' are respectively the received and transmited bytes.

function get_bytes {
	# Find active network interface
	interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
	line=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
	eval $line
	now=$(date +%s%N)
}

function get_velocity {
	value=$1
	old_value=$2
	now=$3

	timediff=$(($now - $old_time))
	velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)

 if test "$velKB" -gt 1024
	then
		echo $(echo "scale=2; $velKB/1024" | bc)MB/s
 else
		echo ${velKB}KB/s
	fi
}

# Get initial values
get_bytes
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

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
  echo -e "  $disk"
}

print_mem(){
   memfree=$(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}')
   mem=$(echo "scale=2; $memfree/1024/1024" | bc)
   echo "  ${mem}G"
}

print_bat(){
  precent=$(acpi -b | grep 'Battery\ 0' | awk '{print $4}' | grep -Eo "[0-9]+")
	echo -e "  ${precent}%"
}

print_date(){
   date=$(date '+%m-%d %a %H:%M')
   echo "  $date"
}

print_cpuinfo(){
   tep=$(sensors | grep Package | awk '{print $4}')
   hzm=$(lscpu | grep CPU\ MHz | awk '{print $3}')
   hzg=$(echo "scale=2; $hzm/1024" | bc)
   echo -e "  $tep ${hzg}GHz"
}

get_bytes
# Calculates speeds
print_netspeed(){
   vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)

   vel_recv=$(get_velocity $received_bytes $old_received_bytes $now)
   if [[ $vel_recv == 0KB/s && $vel_trans == 0KB/s ]]; then
      echo ""
   elif [[ $vel_trans == 0KB/s ]]; then
      echo " $vel_recv"
   elif [[ $vel_recv == 0KB/s ]]; then
      echo " $vel_trans"
   else 
      echo -e " $vel_recv $vel_trans"
   fi
}
print_wifi(){
   ws=$(iw dev wlp3s0 info | grep ssid | awk '{print $1}')
   wn=$(iw dev wlp3s0 info | grep ssid | awk '{print $2}')
   if [[ $ws == ssid ]]; then
      echo " $wn $(print_netspeed)"
   else
      echo ""
      
   fi
}
xsetroot -name "$(print_wifi) $(print_disk) $(print_mem) $(print_cpuinfo) $(print_bat) $(print_date) "


# Update old values to perform new calculations
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

exit 0
