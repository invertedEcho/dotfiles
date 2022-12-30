#!/bin/sh
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/default

xsetroot -cursor_name left_ptr &
xsetroot -solid '#000000' &
xset r rate 150 50 &
dunst &
~/git-repos/dwm-bar/dwm_bar.sh &
gnome-keyring-daemon &
exec dbus-launch awesome
