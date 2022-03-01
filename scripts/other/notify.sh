#!/bin/sh

########
#  I3  #
########

current_ws=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
current_ws_prompt="${current_ws}"

###########
#  TASKS  #
###########

num=$(task rc.verbose=nothing rc.report.next.columns=description.desc rc.report.next.labels= rc.defaultwidth=1000 next +ACTIVE | wc -l)
numplus=$(( $num + 2 ))
if [ $num -gt "0" ]; then
    info=$(env printf "$(task rc.gc=no rc.indent.report=0 rc.verbose=nothing rc.report.next.columns=description.desc rc.report.next.labels= rc.defaultwidth=1000 next +ACTIVE 2>/dev/null </dev/null | awk '$1=$1')")
else
    info=$(env printf "No active tasks\nMaybe do something useful?")
fi

###########
#  PICOM  #
###########

if pgrep -x "picom" > /dev/null
then
    picom_print="ON"
else
    picom_print="OFF"
fi

###########
#  DUNST  #
###########

notification="$(dunstctl is-paused)"
if [ "${notification}" = "false" ]; then
    notification_print="ON"
else
    notification_print="OFF"
fi
toggle_print="Picom: $picom_print"

############
#  VOLUME  #
############

volume="$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"

if [ "${volume}" -lt 25 ]; then
    volume_bar="█▒▒▒"
fi
if [ "${volume}" -gt 24 ] && [ "${volume}" -lt 50 ]; then
    volume_bar="██▒▒"
fi
if [ "${volume}" -gt 49 ] && [ "${volume}" -lt 75 ]; then
    volume_bar="███▒"
fi
if [ "${volume}" -gt 74 ]; then
    volume_bar="████"
fi


##############
#  LANGUAGE  #
##############

KM=$(ibus engine)
if [ "$KM" = "Unikey" ]
then
    lang="VN-TELEX"
else
    if [ "$KM" = "xkb:us::eng" ]
    then
        lang="EN-UK"
    fi
fi

#############
#  UPDATES  #
#############

# updates="$(checkupdates | wc -l)"

###########
#  MEDIA  #
###########

status=$(playerctl status)
song=$(playerctl metadata --format "{{ title }}")
metadata=$(playerctl metadata --format "{{ artist }} - {{ album }}")

echo "▒▒▒░░ <b>$(date +'%a %b %d %H:%M')</b> ░░▒▒▒"
echo "━━━━━━━━━━━━━━━━━"
echo "<b>Workspace</b> [${current_ws_prompt}]"
echo "<b>Layout</b> [${lang}]"
echo "<b>Volume</b> [${volume}%]"
# echo "<b>Updates</b> [${updates} packages]"
echo "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄"
echo "<b>Tasks</b>"
echo "<i>${info}</i>"
echo "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄"
echo "<b>${status}</b>"
echo "<i>${song}</i>"
echo "${metadata}"
echo "━━━━━━━━━━━━━━━━━"
echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
echo "━━━━━━━━━━━━━━━━━"

# notify-send "Layout" "$lang"
# notify-send "Updates" "$updates package(s)"
# notify-send "Workspace" "[$current_ws_prompt]"
# notify-send "Volume" "$volume%"
# notify-send "Toggles" "$toggle_print"
# notify-send "Tasks" "$info"
