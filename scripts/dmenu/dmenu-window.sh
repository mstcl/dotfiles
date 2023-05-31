#!/bin/env bash

# set -e
# windows=$(i3-msg -t get_tree | jq '.. | objects | select(.window_type == "normal") |
# 	{name: (.window_properties.class + ": " + .name), id: .id}')
# selected_window=$(echo "$windows" | jq -r '.name' | dmenu-default -p "Windows" -l 5)
# export selected_window
# window_id=$(echo "$windows" | jq 'select(.name==env.selected_window) | .id') && i3-msg "[con_id=$window_id] focus"


# Date format, for use as the prompt.
date=$(date +"%a %d. %b %R")
height=$(wmctrl -l | wc -l)
if [[ $height -gt 30 ]]
	then heightfit=30
	else heightfit=$height
fi

num=$(wmctrl -l | sed 's/  / /g' | cut -d " " -f 4- | nl -w 3 -n rn | sed -r 's/^([ 0-9]+)[ \t]*(.*)$/\1 - \2/' | dmenu-default -p "$date" -l $heightfit | cut -d '-' -f -1)
[[ -z "$num" ]] && exit
wmctrl -l | sed -n "$num p" | cut -c -10 | xargs wmctrl -i -a
