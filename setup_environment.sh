[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Display Variables
export EDITOR=code-insiders
export GDK_DPI_SCALE=0.4
export GDK_SCALE=2
export QT_QPA_PLATFORMTHEME=qt5ct

prog_bin=/usr/bin
# programs to start
$prog_bin/dunst &
$prog_bin/polkit-dumb-agent &
$prog_bin/pipewire &
$prog_bin/pipewire-pulse &
$prog_bin/pipewire-media-session &

$HOME/scripts/xinput_setup.sh &

# Setup screen
$HOME/scripts/init_displays.sh && $HOME/.fehbg &