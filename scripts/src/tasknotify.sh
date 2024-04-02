#!/bin/sh

num=$(task rc.verbose=nothing rc.report.next.columns=description.desc rc.report.next.labels= rc.defaultwidth=1000 next +ACTIVE | wc -l)
numplus=$(( $num + 2 ))
if [ $num -gt "0" ]; then
    info=$(env printf "Active tasks:\n$(task rc.gc=no rc.indent.report=0 rc.verbose=nothing rc.report.next.columns=description.desc rc.report.next.labels= rc.defaultwidth=1000 next +ACTIVE 2>/dev/null </dev/null | awk '$1=$1' | sed -e 's/^/ • /')")
    notify-send "  Taskwarrior" "$info"
else
    info=$(env printf "No active tasks\nMaybe do something useful?")
    notify-send "  Taskwarrior" "$info"
fi
