#!/bin/sh

if [ -z ${DISPLAY+x} ]; then echo "Wayland"; else echo "X11"; fi
