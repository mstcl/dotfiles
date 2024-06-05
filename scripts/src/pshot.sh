#!/bin/sh -e

# Fullscreen screenshot
# Requires:
#   shotgun
#   hacksaw
#   notify-send

notify-send -i edit-select -e -t 3000 "Taking a screenshot" "Select a region to screenshot"
selection=$(hacksaw -g 3 -s 3 -f "-i %i -g %g")
sleep 0.2
shotgun $selection - | xclip -t 'image/png' -selection clipboard
notify-send -i camera-photo -u normal "Screenshot copied to clipboard"
