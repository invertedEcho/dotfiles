#!/bin/sh
export _JAVA_AWT_WM_NONREPARENTING=1

xsetroot -cursor_name left_ptr &
syncthing &
~/.fehbg &
exec bspwm
