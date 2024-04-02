#!/bin/env bash


# Date format, for use as the prompt.
date=$(date +"%a %d. %b %R")
height=$(wmctrl -l | wc -l)
if [[ $height -gt 30 ]]
	then heightfit=30
	else heightfit=$height
fi

num=$(wmctrl -l | sed 's/  / /g' | cut -d " " -f 4- | nl -w 3 -n rn | sed -r 's/^([ 0-9]+)[ \t]*(.*)$/\1 - \2/' | dmenu_default -p "$date" -l $heightfit | cut -d '-' -f -1)
[[ -z "$num" ]] && exit
wmctrl -l | sed -n "$num p" | cut -c -10 | xargs wmctrl -i -a
