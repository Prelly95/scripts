#!/bin/sh

xrandr \
--output $1 --off --mode 3840x2160 --pos 0x0	-r 60	--rotate normal	--crtc 0 \
--output $2 --mode 3840x2160 --pos 3840x0		-r 30	--rotate normal	--crtc 1 --primary \
--output $3 --mode 3840x2160 --pos 7680x-850	-r 30	--rotate left	--crtc 2


notify-send "Display: WORK"