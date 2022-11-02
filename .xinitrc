#!/bin/sh
export _JAVA_AWT_WM_NONREPARENTING=1

xsetroot -cursor_name left_ptr &
dunst &
~/.fehbg &
~/git-repos/dwm-bar/dwm_bar.sh &
exec dwm
