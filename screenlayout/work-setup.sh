#!/bin/sh

xrandr \
--output $1 --mode 3840x2160 --pos 0x0			-r 60	--rotate normal	--crtc 0 \
--output $2 --mode 3840x2160 --pos 3840x0		-r 30	--rotate normal	--crtc 1 \
--output $3 --mode 3840x2160 --pos 7680x-850	-r 30	--rotate left	--crtc 2

# xrandr --output $1 --pos 0x0 \
# --output $2 --pos 3840x0 --rotate normal  --primary \
# --output $3 --pos 7680x-850 --rotate left

notify-send "Display: WORK"