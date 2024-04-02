#!/usr/bin/env sh
echo $$>$HOME/.cache/fetchcover-pid.tmp
while true
do
    LINK=$(playerctl metadata mpris:artUrl) 2>/dev/null
    ART=$(curl -s --output /tmp/cover_popup.png $LINK)
    sleep 1
    if [ $(playerctl metadata mpris:artUrl) == "$LINK" ]
    then
        :
    else
        LINK2=$(playerctl metadata mpris:artUrl) 2>/dev/null
        ART=$(curl -s --output /tmp/cover_popup.png $LINK2)
    fi
done
