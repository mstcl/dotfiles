#!/bin/sh

########
#  I3  #
########

# current_ws=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
# current_ws_prompt="${current_ws}"

##############
#  LANGUAGE  #
##############

# KM=$(ibus engine)
# if [ "$KM" = "Unikey" ]
# then
#     lang="VN-TELEX"
# else
#     if [ "$KM" = "xkb:us::eng" ]
#     then
#         lang="EN-UK"
#     fi
# fi

###########
#  MEDIA  #
###########
status=$(playerctl status)
metadata=$(playerctl metadata --format "{{ title }} - {{ artist }}")

echo "${status} ${metadata}"
