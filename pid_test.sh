#!/bin/sh


kill_display_setup_scripts() {
	safeword=$(($1-1))
	ps_out=$(ps -ef)
	pids=($(printf "$ps_out" | grep /home/pat/scripts/screenlayout/.*\.sh | awk '{print $2}'))
	pid_count=$(echo ${pids[*]} | wc -w)
	if [ $pid_count -gt 0 ]; then
		kill -15 ${pids[0]} && notify-send KILLED
		if [ $safeword -gt 0 ]; then
			kill_display_setup_scripts $safeword
		fi
	fi
}

notify-send Hello

# debounce unfinished init_display instances
kill_display_setup_scripts 10 # "10" is a max iterations to stop infinite loop
/home/pat/scripts/init_displays.sh