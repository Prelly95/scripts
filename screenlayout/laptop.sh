#!/bin/sh
xrandr --output $1 --primary --mode 3840x2160 -r 60

notify-send "Display: LAPTOP"