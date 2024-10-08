#!/usr/bin/env bash

set -o errexit -o noclobber -o nounset

green=144119ff
pink=ABA2B9ff
red=682828ff
cyan=1d0e53ff
transparent=00000000
bg=630e49ff
fg=cec6bfff
outline=161e29ff

screenH=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2 | head -n 1)
timeposx=150
timeposy=$((screenH - 100))
dateposy=$((timeposy + 90))

i3lock-fancy-rapid 5 pixel \
	--screen=1 \
	--indicator \
	--bar-indicator --bar-color=$bg --bar-direction=0 \
	--bar-orientation=vertical --bar-pos="x:y" --bar-base-width=74 --bar-max-height=40 \
	--keyhl-color=$fg --bshl-color=$pink \
	--verif-text="Verifying..." --wrong-text="Try again" \
	--lockfailed-text="Lock failed!" --lock-text="Locking..." --noinput-text="No input" \
	--time-color=$bg --timeoutline-color=$outline --timeoutline-width=0 \
	--clock --time-str="%H:%M" \
	--time-align=1 --time-size=102 --time-pos="x+$timeposx:y+$timeposy" \
	--time-font=serif \
	--date-color=$bg --dateoutline-color=$outline --dateoutline-width=0 \
	--date-str="%a, %b %d" --date-align=1 --date-size=54 \
	--date-font=serif --date-pos="x+$timeposx:y+$dateposy" \
	--wrong-color=$red --verif-color=$cyan \
	--ringwrong-color=$red --ringver-color=$cyan \
	--verif-font=serif --wrong-font=serif \
	--verif-size=104 --wrong-size=104 \
	--verifoutline-color=$outline --verifoutline-width=0 \
	--wrongoutline-color=$outline --wrongoutline-width=0
