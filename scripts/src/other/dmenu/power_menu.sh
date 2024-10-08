#!/bin/sh

case "$(echo -e "Shutdown\nRestart\nSuspend\nLock\nLogout" | dmenu_default \
    -p \
    "Power:")" in Shutdown) exec systemctl poweroff;;
        Restart) exec systemctl reboot;;
        Suspend) exec systemctl suspend;;
        Lock) exec loginctl lock-session;;
        Logout) exec systemctl restart lemurs;;
esac
