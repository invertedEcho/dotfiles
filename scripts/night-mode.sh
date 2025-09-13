#!/bin/sh
if ~/.local/bin/get-wayland-or-x11.sh | grep -q 'Wayland'; then
	if pgrep -f 'gammastep' >/dev/null; then
	    notify-send "Night Mode off"
	    ps aux | grep 'gammastep' | grep -v grep | awk '{print $2}' | xargs kill
	else
	    notify-send "Night Mode on"
	    gammastep -O 3000
	fi
fi

if ~/.local/bin/get-wayland-or-x11.sh | grep -q 'X11'; then
	redshift -O 4500
fi
