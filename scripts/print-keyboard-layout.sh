#!/bin/sh

OUTPUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

if [[ "$OUTPUT" == "English (US)" ]]; then
    echo "us"
elif [[ "$OUTPUT" == "German" ]]; then
    echo "de"
else
    echo "$OUTPUT"
fi
