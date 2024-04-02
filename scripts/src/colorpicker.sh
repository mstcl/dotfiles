#!/usr/bin/env bash
color=$(xcolor)

if [ -n "$color" ]; then
    temp=$(mktemp --suffix ".png")
    convert -size 100x100 xc:"$color" "$temp"
    echo "$color" | tr -d '\n' | xclip -sel clip
    notify-send -i "$temp" "Colorpicker" "$color" &
    kcolorchooser --color "$color"
fi
