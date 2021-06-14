#!/gearlock/bin/bash

filesdir="$DEPDIR/toolx"

function Lightning() {
	HEIGHT=0
	WIDTH=60
	CHOICE_HEIGHT=0
	BACKTITLE=$(gecpc "By Xtr" "+")
	TITLE="Misc tools"
	MENU="Misc tools"

	OPTIONS=(1 "Find and batch install all apks in folder"
	         2 "Extract gxp or other archive"
	         3 "Backup directory with tar"
	         4 "Make gxp which plays your own video and audio"
			 5 "Change boot sound to your own from wav file"
			 6 "Input device configurator"
			 7 "Install zsh/fish/python shell to alt+f8 console"
			 8 "Modify framework-res (ui icons)")

	CHOICE=$(dialog --clear --cancel-label "Exit" \
	                --backtitle "$BACKTITLE" \
	                --menu "$MENU" \
	                $HEIGHT $WIDTH $CHOICE_HEIGHT \
	                "${OPTIONS[@]}" \
	                2>&1 >/dev/tty)

    case $CHOICE in
    	1)source $filesdir/apk;;
		2)source $filesdir/egxp;;
		3)source $filesdir/tar;;
		4)source $filesdir/gxp;;
		5)source $filesdir/bootsound;;
		6)source $filesdir/idc;;
		7)source $filesdir/zsh;;
		8)source $filesdir/res;;
		*);;
	esac
}


function Loader() {

PCT=0
(
while test $PCT != 105
do
cat <<EOF
XXX
$PCT
$(figlet ToolPack)
. . Made by Xtr  //
XXX
EOF
PCT=`expr $PCT + 5`
sleep 0.05
done
) |

dialog "$@" --gauge "Hi, thanks" 12 45 0; sleep 0.5
Lightning

}


Loader