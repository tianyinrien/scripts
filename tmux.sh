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

### show CPU frequence using cpupower
   # oo=$(cpupower frequency-info | grep "(asserted" | awk '{print $5}')
   # cpu=$(cpupower frequency-info | grep "(asserted" | awk '{print $4}')

   # if [ $oo == "MHz" ]
   # then
   #    zg=$(echo "scale=2; ($cpu)/1024" | bc | awk '{printf "%.2f",$0}')   

   # else
   #    zg=$cpu   
     # fi

      co=$(sensors | grep Core\ 1: | awk '{print $3}' | grep -Eo "[^+0-9.]+")
      echo -e "${zg}GHz +$tep$co"
}

echo -e " | $(print_mem) | $(print_cpuinfo) | $(print_bat) | $(print_date) | "

exit 0
