#!/bin/sh
disp_info=$(xrandr)
disconnected=($(printf "$disp_info" | (grep "\bdisconnected\b") | awk '{print $1;}'))
connected=($(printf "$disp_info" | grep "\bconnected\b" | awk '{print $1;}'))
disp_count=$(echo ${connected[*]} | wc -w)

# Turn off all displays
for dis in "${disconnected[@]}"; do
	xrandr --output $dis --off
done
sleep 1s
for con in "${connected[@]}"; do
	xrandr --output $con --off
done
if [ "$disp_count" -eq "1" ]; then
	/home/pat/scripts/screenlayout/laptop.sh ${connected[@]}
elif [ "$disp_count" -eq "2" ]; then
	/home/pat/scripts/screenlayout/home-setup.sh ${connected[@]}
elif [ "$disp_count" -eq "3" ]; then
	/home/pat/scripts/screenlayout/work-setup.sh ${connected[@]}
fi
/home/pat/.fehbg
