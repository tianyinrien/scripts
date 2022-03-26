#!/bin/bash
result=$(ps ax | grep -v grep | grep trayer )
if [ -z "$result" ]
then
   eval "trayer --margin 8 --width 10 --height 40 --distance 8 &"
else
   eval "killall trayer"
fi

    

