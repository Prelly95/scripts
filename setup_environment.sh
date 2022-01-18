[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Display Variables
export EDITOR=code-insiders
export GDK_DPI_SCALE=0.4
export GDK_SCALE=2
export QT_QPA_PLATFORMTHEME=qt5ct

t=$(date | awk '{print $5}')
hm=$(echo $t | cut -d':' -f1)$(echo $t | cut -d':' -f2)
if [[ $hm -ge 1930 ]]; then
	sct 3400 && brillo -S 20
else
	sct && brillo -S 100
fi

prog_bin=/usr/bin
# programs to start
$prog_bin/dunst &
$prog_bin/polkit-dumb-agent &
$prog_bin/pipewire &
$prog_bin/pipewire-pulse &
$prog_bin/pipewire-media-session &

$HOME/scripts/xinput_setup.sh &

# Setup screen
$HOME/scripts/init_displays.sh &

# Start gnome keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK