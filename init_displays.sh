#!/bin/bash

if pidof -o %PPID -x "init_displays.sh" >/dev/null; then
    echo "Process already running"
    exit 1
fi

sleep 1s
disp_info=$(xrandr)
disconnected=($(printf "$disp_info" | grep "\bdisconnected\b" | awk '{print $1;}'))
connected=($(printf "$disp_info" | grep "\bconnected\b" | awk '{print $1;}'))
disp_count=$(echo ${connected[*]} | wc -w)

# Turn off all displays
for dis in "${disconnected[@]}"; do
	xrandr --output "$dis" --off
done


if [ "$disp_count" -eq "1" ]; then
	~/.screenlayout/laptop_layout.sh
    feh --no-fehbg --bg-center "$HOME/Tools/scripts/screenlayout/bg-laptop.jpeg"
elif [ "$disp_count" -eq "3" ]; then
	~/.screenlayout/desk_layout.sh
    feh --no-fehbg --bg-center --no-xinerama "$HOME/Tools/scripts/screenlayout/bg-multi.jpeg"
fi



# Set the brightness based on the time of day
# t=$(date | awk '{print $5}')
# hm=$(echo $t | cut -d':' -f1)$(echo $t | cut -d':' -f2)
# if [[ $hm -ge 1930 ]]; then
# 	sct 2800 && brillo -S 25
# else
# 	sct && brillo -S 100
# fi

