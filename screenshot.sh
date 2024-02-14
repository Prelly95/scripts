#!/bin/bash

sel_str=$(slop -f "-i %i -g %g" -o) > /dev/null

IFS=' ' read -ra sel <<< "$sel_str"

if [[ ${#sel[@]} -eq 0 ]]; then
    exit 1
fi

name=$(date +"%Y-%m-%d-%M-%S")
destination="$HOME/Pictures/Screenshots/${name}_shotgun.png"

shotgun "${sel[@]}" "$destination"
xclip -selection clipboard -t image/png -i "$destination"
feh -d "$destination"