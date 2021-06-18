#!/gearlock/bin/bash
## For proper developer documentation, visit https://wiki.supreme-gamers.com/gearlock/developer-guide
# Check `!zygote.sh` to configure your package functions or gearlock can also guide you during the build process

#####--- Import Functions ---#####
get_base_dir # Returns execution directory path in $BD variable
# get_net_stat

# ! check_compat 7.2.8 && echo -e 'error: Please update gearlock to the latest version to install this' && exit 1
test "$TERMINAL_EMULATOR" != yes && echo -e 'error: Please install from GearLock app in a booted-system' && exit 1
clear

command -v alsa_aplay 1>/dev/null && cmd="alsa_aplay"
command -v aplay 1>/dev/null && cmd="aplay"
test -z "$cmd" && echo -e "error: Not available for your PC" && exit 1

cd "$BD/gearlock"

./gameloop.exe -f 60 tencent.exe &
$cmd pubg.exe >/dev/null 2>&1

clear
kill -9 $(pgrep "gameloop.exe" | xargs) >/dev/null 2>&1
echo -e "Thanks for being rickrolled, have a good day."
exit 0
