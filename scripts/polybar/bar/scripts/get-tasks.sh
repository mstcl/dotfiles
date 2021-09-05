#!/usr/bin/env bash
num=$(task rc.verbose=nothing active | wc -l)
if [ "$num" -gt "0" ]
then
    echo " " 2>/dev/null
else
    echo "﯈ " 2>/dev/null
fi
