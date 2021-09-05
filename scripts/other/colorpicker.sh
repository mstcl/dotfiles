#!/usr/bin/env bash
color=$(xcolor)

if [ -n "$color" ]; then
    temp=$(mktemp --suffix ".png")
    convert -size 100x100 xc:$color $temp
    echo $color | xsel -ib
    notify-send -i $temp "Colorpicker" "$color"
fi
