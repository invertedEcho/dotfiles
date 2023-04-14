#!/bin/bash

num_monitors=$(xrandr --listmonitors | awk '/Monitors/ {print $2}')

if [ "$num_monitors" -eq 1 ]; then
  notify-send "Only one monitor is connected"
else
  xrandr --auto
  ~/.fehbg
  notify-send "Updated monitor configuration"
fi

