#!/bin/sh
if pgrep -x gammastep >/dev/null
then
    notify-send "Night Mode off"
    killall gammastep
else
    notify-send "Night Mode on"
    gammastep -O 3000
fi
