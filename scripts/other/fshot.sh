#!/bin/sh -e
current=$(date +%F_%H-%M-%S)
shotgun -g 1920x1080+0+0 ~/pictures/screenshots/$current.png
sleep 0.5
notify-send -u normal "Shotgun - screenshot saved" "$current.png"
