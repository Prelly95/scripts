#!/bin/sh
xrandr \
--output $1 --mode 3840x2160 --primary \
--output $2 --primary --mode 3840x2160 -r 60 --right-of $1

notify-send "Display: HOME SETUP"
