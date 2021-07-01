


#------------------------------------------------------------------------------
function Filebrowser()
{

    if [ -z $2 ] ; then
        dir_list=($(ls -lhp  | awk -F ' ' ' { print $9 " " $5 } '))
    else
        cd "$2"
        dir_list=($(ls -lhp  | awk -F ' ' ' { print $9 " " $5 } '))
    fi
	HEIGHT=20
	WIDTH=60
	CHOICE_HEIGHT=23
    curdir=$(pwd)
    if [ "$curdir" == "/" ] ; then  # Check if you are at root folder
        selection=$(dialog --title "$1" \
							  --ok-label Select \
                              --cancel-label Cancel \
							  --menu "$curdir" \
							  $HEIGHT $WIDTH $CHOICE_HEIGHT \
                              "${dir_list[@]}" 3>&1 1>&2 2>&3)
    else   # Not Root Dir so show ../ BACK Selection in Menu
        selection=$(dialog --title "$1" \
							  --ok-label Select \
							  --cancel-label Cancel \
							  --extra-button --extra-label Back \
                              --menu "$curdir" \
							  $HEIGHT $WIDTH $CHOICE_HEIGHT \
                              "${dir_list[@]}" 3>&1 1>&2 2>&3)
    fi

    RET=$?
	if [ $RET = 3 ]; then
	Filebrowser "$1" "../"
	fi
    if [ $RET -eq 1 ]; then  # Check if User Selected Cancel
       return 1	
    elif [ $RET -eq 0 ]; then
       if [[ -d "$selection" ]]; then  # Check if Directory Selected
          Filebrowser "$1" "$selection"
       elif [[ -f "$selection" ]]; then  # Check if File Selected
          if [[ $selection == *$filext ]]; then   # Check if selected File has .jpg extension
            if (dialog --title "Confirm Selection" --yes-label "Confirm" --no-label "Retry" --yesno "Location : $curdir\nFileName:$selection" 7 45); then
                filename="$selection"
                filepath="$curdir"   
            else
                Filebrowser "$1" "$curdir"
            fi
          else   # Not correct extension so Inform User and restart
             dialog --title "ERROR: File Must have $filext Extension" --msgbox "$selection\nYou Must Select a $filext file" 7 45
             Filebrowser "$1" "$curdir"
          fi
       else
          # Could not detect a file or folder so Try Again
          dialog --title "ERROR: Selection Error" \
                 --msgbox "Error Changing to Path $selection" 7 45
				 Filebrowser "$1" "$curdir"
       fi
    fi
}


Filebrowser "$menutitle" "$startdir"

exitstatus=$?
if [ $exitstatus -eq 0 ]; then
    if [ "$selection" == "" ]; then
	r_action
    else
    file_action
	fi  
fi

 