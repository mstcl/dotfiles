#!/usr/bin/env bash
color=$(xcolor)

if [ -n "$color" ]; then
	temp=$(mktemp --suffix ".png")
	convert -size 100x100 xc:"$color" "$temp"
	echo "$color" | tr -d '\n' | nohup xclip -loops 0 -r -sel c >/dev/null 2>&1
	kcolorchooser --color "$color"
fi
