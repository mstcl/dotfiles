#!/bin/sh

num=$(task active | wc -l)
if [ $num -gt "1" ]; then
    info=$(env printf "Active tasks:\n$(task rc.gc=no rc.indent.report=4 rc.verbose= rc.report.next.columns=description.desc rc.report.next.labels= rc.defaultwidth=1000 next +ACTIVE 2>/dev/null </dev/null | sed -n '3 p' | awk '$1=$1')")
    notify-send "Taskwarrior" "$info"
else
    info=$(env printf "No active tasks\nMaybe do something useful?")
    notify-send "Taskwarrior" "$info"
fi
