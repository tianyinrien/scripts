#!/bin/bash

/bin/notify-send "CPU Usage" "$(ps axch -o cmd:20,%cpu --sort=-%cpu |
head -n 20)"
