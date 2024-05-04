#!/usr/bin/env bash

LAPTOP_SCREEN_NAME=eDP-1

ALL_MONITORS=$(hyprctl -j monitors)

OUTPUT=$(echo "$ALL_MONITORS" | jq --arg laptop_screen_name "$LAPTOP_SCREEN_NAME" -r '.[] | select(.name == $laptop_screen_name) | .name')

if [ -n "$OUTPUT" ]; then
  hyprctl keyword monitor DP-2, 2560x1440@144,0x0,1
  hyprctl keyword monitor DP-1, 2560x1440@144,2560x0,1
  hyprctl keyword monitor $LAPTOP_SCREEN_NAME, disable
  notify-send "Successfully setup monitors for Office."
else
  hyprctl keyword monitor HDMI-A-1,highres,0x0,1
  hyprctl keyword monitor DP-3,1920x1080@144,1920x0,1
  notify-send "Successfully setup monitors for Home."
fi
