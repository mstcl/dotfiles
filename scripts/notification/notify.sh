#!/bin/sh

########
#  I3  #
########

current_ws=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
current_ws_prompt="${current_ws}"

############
#  VOLUME  #
############

volume="$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"

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

###########
#  MEDIA  #
###########
status=$(playerctl status)
metadata=$(playerctl metadata --format "{{ title }} - {{ artist }}")

echo "$(date +'%a %b %d %H:%M') │ Workspace [${current_ws_prompt}] │ Input [${lang}] │ Volume [${volume}%] │ ${status} ${metadata}"
