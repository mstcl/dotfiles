#!/bin/bash
SERVICE="picom"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "麗 "
else
    echo "ﱵ "
fi
