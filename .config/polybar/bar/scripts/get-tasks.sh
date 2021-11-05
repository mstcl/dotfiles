#!/usr/bin/env bash
num=$(task rc.verbose=nothing rc.report.next.columns=description.desc rc.report.next.labels= rc.defaultwidth=1000 next +ACTIVE | wc -l)
if [ "$num" -gt "0" ]
then
    echo " " 2>/dev/null
else
    echo "﯈ " 2>/dev/null
fi
