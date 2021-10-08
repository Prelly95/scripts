#!/bin/sh
# Dependencies:
# grabc - suckless util
# xclip

# Bound to MOD "G"

c=$(grabc)
printf $c | xclip -selection c