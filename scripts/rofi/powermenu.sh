#!/usr/bin/env bash

dir="$HOME/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" 襤 Shutdown "
reboot=" Restart "
lock="  Lock "
suspend="  Sleep "

# Confirmation
confirm_exit() {
    rofi -dmenu\
        -i\
        -no-fixed-num-lines\
        -p "Confirm [y/n] "\
        -theme $dir/confirm.rasi
    }

# Message
msg() {
    rofi -theme "$dir/message.rasi" -e "Enter [y/n]"
}

# Variable passed to rofi
options="$lock\n$suspend\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -i -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            systemctl poweroff
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $reboot)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            systemctl reboot
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $lock)
        if [[ -f /usr/bin/i3lock ]]; then
            loginctl lock-session
        elif [[ -f /usr/bin/betterlockscreen ]]; then
            betterlockscreen -l
        fi
        ;;
    $suspend)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            loginctl lock-session
            sleep 2
            systemctl suspend
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
esac
