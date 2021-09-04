#!/gearlock/bin/bash

filesdir="$DEPDIR/toolx"

function Main_menu() {
	HEIGHT=0
	WIDTH=60
	CHOICE_HEIGHT=0
	BACKTITLE=$(gecpc "By Xtr" "+")
	TITLE="Misc tools"
	MENU="Misc tools"

	OPTIONS=(1 "Find and batch install all apks in folder"
			 2 "Input device configurator"
	         3 "Disable/enable boot animation"
	         4 "system settings changer"
			 5 "Change boot sound(only .wav)"
			 6 "Extract gxp/any archive to RAM(faster)"
			 7 "Install zsh/fish/python shell to alt+f8 console"
			 8 "Modify framework-res (ui icons)"
			 9 "Free up some RAM"
			 10 "Make gxp")

	CHOICE=$(dialog --clear --cancel-label "Exit" \
	                --backtitle "$BACKTITLE" \
	                --menu "$MENU" \
	                $HEIGHT $WIDTH $CHOICE_HEIGHT \
	                "${OPTIONS[@]}" \
	                2>&1 >/dev/tty)

    case $CHOICE in
    	1)source $filesdir/apk;;
		2)source $filesdir/idc;;
		3)	animation_on="
		debug.sf.nobootanimation 0
		"
		3)	animation_off="
		debug.sf.nobootanimation 1
		"
		
			if (dialog --yes-label Disable --no-label Enable \
			--yesno "Disables boot animation with build.prop line, useful for fast boot/ SSD" 7 45); then
				gearprop "$animation_off"
			else 
				gearprop "$animation_on"
            fi
		;;
		4)source $filesdir/settings;;
		5)source $filesdir/bootsound;;
		6)source $filesdir/egxp;;
		7)source $filesdir/zsh;;
		8)source $filesdir/res;;
			
			
		9)	
		mem_free="$(free -h)"
		geco "${YELLOW}Memory usage before cleaning :${RC}"
		geco "${RED}$mem_free${RC}"
			echo 3 > /proc/sys/vm/drop_caches
		
			geco "${GREEN}Memory usage after cleaning :${RC}"
		free -h
		;;
		10)source $filesdir/gxp;;
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
. . . Made by Xtr  //
XXX
EOF
PCT=`expr $PCT + 5`
sleep 0.05
done
) |

dialog --no-collapse --gauge "Hi, thanks" 12 45 0; sleep 0.5
Main_menu

}


Loader
