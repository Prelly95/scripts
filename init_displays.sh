#!/bin/sh
disp_count=$(xrandr | grep -oi ' connected' | wc -l)
if [ "$disp_count" -eq "2" ]; then
	disp_type=$(xrandr | grep -oi -m1 '\S* connected')
	echo $disp_type
	if [[ $disp_type == *"-"* ]]; then
		~/scripts/screenlayout/home-setup-nvidia.sh
	else
		~/scripts/screenlayout/home-setup-intel.sh
	fi
fi
~/.fehbg