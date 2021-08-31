#!/bin/sh -e

selection=$(hacksaw -g 3 -s 3 -f "-i %i -g %g")
sleep 0.2
shotgun $selection - | xclip -t 'image/png' -selection clipboard
