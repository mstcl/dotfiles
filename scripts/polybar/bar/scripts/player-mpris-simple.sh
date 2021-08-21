#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
	if [[ $(playerctl metadata --format "{{artist}}" 2> /dev/null) ]]; then
		echo "$(playerctl metadata --format "{{artist}} - {{title}}" 2> /dev/null)"
	else
		echo "$(playerctl metadata --format "{{title}}" 2> /dev/null)"
	fi
elif [ "$player_status" = "Paused" ]; then
    echo "Paused"
else
    echo ""
fi
