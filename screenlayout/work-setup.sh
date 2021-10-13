#!/bin/sh
xrandr \
--output $1  --mode 3840x2160 -r 60 --pos 0x1000 --crtc 1 \
--output $2 --mode 3840x2160 -r 30 --pos 3840x1000 --rotate normal  --primary --crtc 0 \
--output $3 --mode 3840x2160 -r 30 --pos 7680x0 --rotate left --crtc 2

notify-send "Display: WORK"