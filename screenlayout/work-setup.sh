#!/bin/sh

xrandr \
--output $1  --mode 3840x2160 -r 60 --crtc 1

xrandr \
--output $2 --mode 3840x2160 -r 30 --crtc 0 \
--output $3 --mode 3840x2160 -r 30 --crtc 2

xrandr --output eDP-1-1 --pos 0x0 \
--output DP-1-1-1 --pos 3840x0 --rotate normal  --primary \
--output DP-1-1-2 --pos 7680x-850 --rotate left
notify-send "Display: WORK"