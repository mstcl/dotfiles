#!/bin/env bash

set -e

windows=$(i3-msg -t get_tree | jq '.. | objects | select(.window_type == "normal") |
	{name: (.window_properties.class + ": " + .name), id: .id}')

selected_window=$(echo "$windows" | jq -r '.name' | dmenu-def -p "Windows" -l 5)
export selected_window

window_id=$(echo "$windows" | jq 'select(.name==env.selected_window) | .id') && i3-msg "[con_id=$window_id] focus"
