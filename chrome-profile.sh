choice="DroneShield\nPat"
prof=$(printf $choice | dmenu -i -p "Google Chrome Profile")

case $prof in
	"DroneShield")
		google-chrome-stable --profile-directory="Profile 1"
		;;

	"Pat")
		google-chrome-stable --profile-directory="Default"
		;;
esac