xrandr --output DP-1-3 --off
sleep 0.5s

xrandr --output DP-1-1 --off
xrandr --output DP-1-2 --off
xrandr --output DP-1-3 --off

xrandr --output DP-1-3 --primary --mode 3840x2160 -r 60
xrandr --output eDP-1-1 --mode 3840x2160 -r 60 --left-of DP-1-3
