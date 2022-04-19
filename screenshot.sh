sel=$(slop -f "-i %i -g %g" -o) > /dev/null
echo $sel
name=$(date +"%Y-%m-%d-%M-%S")
destination="$HOME/Pictures/Screenshots/${name}_shotgun.png"
shotgun $sel $destination
xclip -selection clipboard -t image/png -i $destination
feh -d --start-at $destination "$HOME/Pictures/Screenshots/"