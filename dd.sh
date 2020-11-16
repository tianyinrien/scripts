#!/bin/sh
# dmenu-based directory browser
# to run from terminal:
#    source /path/to/dbdb.sh
# or bind it to shortcut:
#   echo bind \'\"\\C-o\":\"source /path/to/dbdb.sh\\n\"\' >> ~/.bashrc

chosen="placeholder"

while [ ! -z "$chosen" ]; do
    DIRs=$( ls -a1p | grep -P '^\w[^\$/]+/$' | awk -vRS="\n" -vORS="\t" '1')
    DOTDs=$( ls -a1p | grep -P '^\.[^\$/]+/$' | awk -vRS="\n" -vORS="\t" '1')
    FILEs=$( ls -a1p | grep -P '^\w[^\$/]+$' | awk -vRS="\n" -vORS=" \t" '1')
    DOTFs=$( ls -a1p | grep -P '^\.[^\$/]+$' | awk -vRS="\n" -vORS=" \t" '1')
    chosen=`( ( echo -e "$DIRs$DOTDs$FILEs$DOTFs" | awk -vRS="\t" -vORS="\n" '1' ) | dmenu -i -l 10 -p Dir: -fn "Agave Nerd Font:size=18" -x 500 -y 400 -w 1500 -h 65 -nb "#333333" -nf "#999999" -sb "#999999" )`
cd $chosen
done
