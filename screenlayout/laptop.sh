#!/bin/sh
xrandr --output $1 --mode 3840x2160 -r 60
feh --no-fehbg --bg-center "$HOME/scripts/screenlayout/bg_1.png"

notify-send "Display: LAPTOP"