#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge -I"$HOME" ~/.Xresources

# Display Variables
export EDITOR=code-insiders
export TERMINAL=alacritty
# export GDK_DPI_SCALE=0.4
# export GDK_SCALE=2
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=1

prog_bin=/usr/bin/
# programs to start

eval $prog_bin/dunst &
eval $prog_bin/polkit-dumb-agent &
eval $prog_bin/pipewire &
eval $prog_bin/pipewire-pulse &
eval $prog_bin/wireplumber &

# /usr/local/bin/dwmblocks &

"$HOME"/Tools/scripts/xinput_setup.sh &

# Setup screen
"$HOME"/Tools/scripts/init_displays.sh &

# Start gnome keyring
# source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval "$(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)"
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
mkdir -p "$HOME"/.local/share/keyrings
