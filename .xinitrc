#!/bin/sh
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/default

xset r rate 150 50 &
xsetroot -cursor_name left_ptr &
dunst &
~/.fehbg &
~/git-repos/dwm-bar/dwm_bar.sh &
exec dbus-run-session dwm
