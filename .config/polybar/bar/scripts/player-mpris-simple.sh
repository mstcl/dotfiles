#!/bin/sh

player_status=$(playerctl -p ncspot,mpd status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
	if [[ $(playerctl -p ncspot,mpd metadata --format "{{artist}}" 2> /dev/null) ]]; then
		echo "$(playerctl -p ncspot,mpd metadata --format "{{artist}} - {{title}}" 2> /dev/null)"
	else
		echo "$(playerctl -p ncspot,mpd metadata --format "{{title}}" 2> /dev/null)"
	fi
elif [ "$player_status" = "Paused" ]; then
    echo "Paused"
else
    echo ""
fi
