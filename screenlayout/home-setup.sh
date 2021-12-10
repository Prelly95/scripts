#!/bin/sh
xrandr \
--output $1 --mode 3840x2160 --primary \
--output $2 --primary --mode 3840x2160 -r 60 --right-of $1

feh --no-fehbg --bg-center "$HOME/scripts/screenlayout/bg_2.png" "$HOME/scripts/screenlayout/bg_1.png"
notify-send "Display: HOME SETUP"
