#!/usr/bin/env bash

# dmenu theming
lines="-l 26"

selected="$(ps ax | \
            dmenu -i -p "Type to Kill:" \
            $lines | \
            awk '{print $1" "$4}')"; 

if [[ ! -z $selected ]]; then

    answer="$(echo -e "Yes\nNo" | \
            dmenu -i -p "$selected will be killed, are you sure?" \
            $lines)"

    if [[ $answer == "Yes" ]]; then
        selpid="$(awk '{print $1}' <<< $selected)"; 
        sudo kill -9 $selpid 
    fi
fi

exit 0
