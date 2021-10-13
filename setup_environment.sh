[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Display Variables
export EDITOR=code-insiders
export GDK_DPI_SCALE=0.4
export GDK_SCALE=2
export QT_QPA_PLATFORMTHEME=qt5ct

# programs to start
/usr/bin/dunst &
polkit-dumb-agent &

$HOME/scripts/xinput_setup.sh &

# Setup screen
$HOME/scripts/init_displays.sh && $HOME/.fehbg &