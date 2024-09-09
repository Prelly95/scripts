#!/bin/sh
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
xinput --set-prop "VEN_04F3:00 04F3:32AA Touchpad" "libinput Horizontal Scroll Enabled" 1
xinput --set-prop "VEN_04F3:00 04F3:32AA Touchpad" "libinput Tapping Enabled" 1
xinput --set-prop "VEN_04F3:00 04F3:32AA Touchpad" "libinput Tapping Button Mapping Enabled" 1 0
# /home/patrick/Tools/scripts/set_mouse_speed.sh
