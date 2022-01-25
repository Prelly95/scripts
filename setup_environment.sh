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
$prog_bin/wireplumber &

$HOME/scripts/xinput_setup.sh &

# Setup screen
$HOME/scripts/init_displays.sh &

# Start gnome keyring

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# init keyring
# export keyring
