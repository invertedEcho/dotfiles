#!/bin/sh

i3status | while :
do
  read line
  echo "$(playerctl metadata title) - $(playerctl metadata artist) | $line" || exit 1
done
