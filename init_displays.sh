#!/bin/sh
sleep 1s
disp_info=$(xrandr)
disconnected=($(printf "$disp_info" | (grep "\bdisconnected\b") | awk '{print $1;}'))
connected=($(printf "$disp_info" | grep "\bconnected\b" | awk '{print $1;}'))
disp_count=$(echo ${connected[*]} | wc -w)

# Turn off all displays
for dis in "${disconnected[@]}"; do
	xrandr --output $dis --off
done

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

if [ "$disp_count" -eq "1" ]; then
	/home/pat/scripts/screenlayout/laptop.sh ${connected[@]}
elif [ "$disp_count" -eq "2" ]; then
	/home/pat/scripts/screenlayout/home-setup.sh ${connected[@]}
elif [ "$disp_count" -eq "3" ]; then
	/home/pat/scripts/screenlayout/work-setup.sh ${connected[@]}
fi

t=$(date | awk '{print $5}')
hm=$(echo $t | cut -d':' -f1)$(echo $t | cut -d':' -f2)
if [[ $hm -ge 1930 ]]; then
	sct 2800 && brillo -S 25
else
	sct && brillo -S 100
fi

feh --no-fehbg --bg-center "$HOME/scripts/screenlayout/bg_2.png" "$HOME/scripts/screenlayout/bg_1.png" "$HOME/scripts/screenlayout/bg_3.png"
