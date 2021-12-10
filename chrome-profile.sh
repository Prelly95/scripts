choice="Pat\nAirsight\nBorne"
prof=$(printf $choice | dmenu -i -p "Google Chrome Profile")

case $prof in
	"Pat")
		google-chrome-stable --profile-directory="Profile 2"
		;;

	"Airsight")
		google-chrome-stable --profile-directory="Default"
		;;

	"Borne")
		google-chrome-stable --profile-directory="Profile 1"
		;;
	*)
		;;
esac