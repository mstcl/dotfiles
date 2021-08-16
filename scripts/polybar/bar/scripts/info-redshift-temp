#!/bin/sh
SHORT=0

if [ "$(pgrep -x redshift)" ]; then
    temp=$(redshift -p 2> /dev/null | grep temp | cut -d ":" -f 2 | tr -dc "[:digit:]")
#echo "$temp"
    if [ -z "$temp" ]; then
        let SHORT="$temp/1000"
        echo "${SHORT}K"
    elif [ "$temp" -ge 6000 ]; then
        let SHORT="$temp/1000"
        echo "${SHORT}K"
    elif [ "$temp" -ge 5000 ]; then
        let SHORT="$temp/1000"
        echo "${SHORT}K"
    elif [ "$temp" -ge 4000 ]; then
        let SHORT="$temp/1000"
        echo "${SHORT}K"
    else
        let SHORT="$temp/1000"
        echo "${SHORT}K"
    fi
fi
