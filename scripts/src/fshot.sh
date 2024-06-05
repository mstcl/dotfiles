#!/bin/sh -e

# Fullscreen screenshot
# Requires:
#   shotgun
#   notify-send

notify-send -e -t 1800 "Taking a screenshot" "in 3 seconds"
sleep 3
current=$(date +%F_%H-%M-%S)
shotgun -g 1920x1080+0+0 ~/pictures/Screenshots/$current.png
sleep 0.5
notify-send -i camera-photo -e -u normal "Screenshot saved" "$current.png"
