#!/usr/bin/env bash

PREVIEW_TEXT="ABCDEFGHIJKLM\n"\
"NOPQRSTUVWXYZ\n"\
"abcdefghijklm\n"\
"nopqrstuvwxyz\n"\
"1234567890\n"\
"!@$\%(){}[]"\
"<!-- != == ->\n"\
"-| #[ |> <$> ~@"

generate_preview() {
    convert -size "532x365" xc:"#202020" \
            -gravity center \
            -pointsize 28 \
            -font "$1" \
            -fill "#999999" \
            -annotate +0+0 "${1}\n ${PREVIEW_TEXT}" \
            -flatten "$2"
}

font=$(convert -list font | awk -F: '/^[ ]*Font: /{print substr($NF,2)}' | fzf --prompt="$SEARCH_PROMPT")
generate_preview "$font" "/tmp/font.png"
kitty +kitten icat /tmp/font.png
