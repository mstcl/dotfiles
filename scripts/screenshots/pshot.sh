#!/bin/sh -e
notify-send -t 3000 " Screenshot" "Select a region to screenshot"
selection=$(hacksaw -g 3 -s 3 -f "-i %i -g %g")
sleep 0.2
shotgun $selection - | xclip -t 'image/png' -selection clipboard
notify-send -u normal " Screenshot copied to clipboard"
