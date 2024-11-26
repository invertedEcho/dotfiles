#!/usr/bin/env bash

LAPTOP_SCREEN_NAME=eDP-1

ALL_MONITORS=$(hyprctl -j monitors all)

# COUNT_OF_MONITORS=$(echo "$ALL_MONITORS" | jq length)
# if [ "$COUNT_OF_MONITORS" = "1" ]; then
#   hyprctl keyword monitor eDP-1,preferred,auto,1
#   notify-send "Successfully setup laptop screen"
#   exit;
# fi

OUTPUT=$(echo "$ALL_MONITORS" | jq --arg laptop_screen_name "$LAPTOP_SCREEN_NAME" -r '.[] | select(.name == $laptop_screen_name) | .name')

if [ -n "$OUTPUT" ]; then
  hyprctl keyword monitor desc:GIGA-BYTE TECHNOLOGY CO. LTD. G27Q 23082B003536, 2560x1440,2560x0,1
  hyprctl keyword monitor desc:GIGA-BYTE TECHNOLOGY CO. LTD. G27Q 23082B003522, 2560x1440,0x0,1
  hyprctl keyword monitor eDP-1,preferred,auto,1

  hyprctl dispatch moveworkspacetomonitor 1 desc:GIGA-BYTE TECHNOLOGY CO. LTD. G27Q 23082B003522
  hyprctl dispatch moveworkspacetomonitor 2 desc:GIGA-BYTE TECHNOLOGY CO. LTD. G27Q 23082B003536
  notify-send "Successfully setup monitors for Office."
else
  hyprctl keyword monitor desc:Dell Inc. DELL U2415 7MT0177A2T2S,highres,0x0,1
  hyprctl keyword monitor desc:Acer Technologies Acer KG271 C 0x9231F806,1920x1080@144,1920x0,1
  # https://github.com/hyprwm/Hyprland/issues/6032
  hyprctl keyword monitor Unknown-1,disable

  hyprctl dispatch moveworkspacetomonitor 2 desc:Dell Inc. DELL U2415 7MT0177A2T2S
  hyprctl dispatch moveworkspacetomonitor 1 desc:Acer Technologies Acer KG271 C 0x9231F806
  notify-send "Successfully setup monitors for Home."
fi
