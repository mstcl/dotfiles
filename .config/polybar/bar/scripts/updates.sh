#!/usr/bin/env bash

NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg

get_total_updates() { UPDATES=$(checkupdates | wc -l); PACKAGES=$(checkupdates | cut -f 1 -d " " | sed ':a;N;$!ba;s/\n/, /g'); }

while true; do
    get_total_updates
    echo ""
    # notify user of updates
    if hash notify-send &>/dev/null; then
        if (( UPDATES > 50 )); then
            notify-send -u critical \
                "Packages with updates" "$UPDATES new packages"
        elif (( UPDATES > 25 )); then
            notify-send -u normal \
                "Packages with updates" "$UPDATES new packages"
        elif (( UPDATES > 2 )); then
            notify-send -u low \
                "$UPDATES new packages" \
                "$PACKAGES"
        fi
    fi

    # when there are updates available
    # every 10 seconds another check for updates is done
    while (( UPDATES > 0 )); do
        if (( UPDATES == 1 )); then
            echo ""
        elif (( UPDATES > 1 )); then
            echo ""
        else
            echo ""
        fi
        sleep 10
        get_total_updates
    done

    # when no updates are available, use a longer loop, this saves on CPU
    # and network uptime, only checking once every 30 min for new updates
    while (( UPDATES == 0 )); do
        echo ""
        sleep 1800
        get_total_updates
    done
done
