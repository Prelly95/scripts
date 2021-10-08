#!/bin/sh
xrandr --output DP1 --off
xrandr --output DP2 --off
xrandr --output DP3 --off
xrandr --output DP3 --primary --mode 3840x2160 -r 60
xrandr --output eDP1 --mode 3840x2160 -r 60 --left-of DP3
