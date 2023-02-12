#!/bin/sh
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/default

xset r rate 150 50 &
dunst &
gnome-keyring-daemon &
lxpolkit &
~/.fehbg &
exec dbus-launch bspwm
