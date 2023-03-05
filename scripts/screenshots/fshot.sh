#!/bin/sh -e
notify-send -t 1800 " Screenshot" "In 3 seconds"
sleep 3
current=$(date +%F_%H-%M-%S)
shotgun -g 1920x1080+0+0 ~/pictures/Screenshots/$current.png
sleep 0.5
notify-send -u normal "  Screenshot saved" "$current.png"
