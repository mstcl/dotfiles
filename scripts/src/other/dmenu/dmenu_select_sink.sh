#!/bin/bash
list_sinks() {
    sinks=$(pactl list sinks short) || return 1
    echo "$sinks" | sed -e "s/\t/\ /g"
}

select_sink() {
    sink="$(list_sinks | dmenu_default -p "Audio sink:")" || return 1
    sink="$(echo "$sink" | cut -f 1 -d " ")"
    [ -n "$sink" ] || return 1

    pactl set-default-sink $sink || return 1
}

case "$1" in
	list) list_sinks || exit 1;;
    current);;
	*) select_sink || exit 1;;
esac

exit 0
