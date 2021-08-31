#!/bin/bash

# Colors
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;90m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

cat .termshark-replace.toml > termshark.toml

# Main
export HOME
DOT_DIR="$HOME/dotfiles"
function get_dest {
    read -r line<$1
    echo $line | cut -d: -f2
}
function get_dest_alt {
    echo $(sed -n '2p'<$1) | cut -d: -f2
}

for FILE in $DOT_DIR/*
do
    if [ "${FILE}" != "$DOT_DIR/README.md" ] && [ "${FILE}" != "$DOT_DIR/symlinks" ] && [ "${FILE}" != "$DOT_DIR/push.sh" ] && [ "${FILE}" != "$DOT_DIR/dot-init.sh" ] && [ "${FILE}" != "$DOT_DIR/ultisnips" ] && [ "${FILE}" != "$DOT_DIR/scripts" ] && [ "${FILE}" != "$DOT_DIR/screenshots" ]
    then
        if [[ "${FILE}" == "$DOT_DIR"/fontconfig* ]] || [[ "${FILE}" == "$DOT_DIR"/*.tmTheme ]]
        then
            DEST="$HOME/$(get_dest_alt "$FILE")"
        else
            DEST="$HOME/$(get_dest "$FILE")"
        fi
        FOLDER=$( echo "$DEST" | grep -o '^.*\/')
        FILENAME=$( echo "$DEST" | grep -o '[^\/]*$')
        echo -e ""
        if [[ -f "$DEST" ]];
        then
            echo -e "${DARKGRAY}--> ${YELLOW}File exists, moving to ${LIGHTRED}$DEST.old${NOCOLOR}"
            mv "$DEST" "$FOLDER/.$FILENAME.old"
            echo -e "${DARKGRAY}--> ${LIGHTGREEN}Creating symlink${NOCOLOR}"
            ln -s $FILE $DEST
            echo -e "${DARKGRAY}--> ${GREEN}Done ✓${NOCOLOR}${NOCOLOR}"
        else
            echo -e "${DARKGRAY}--> ${LIGHTGREEN}File doesn't exist, creating symlink...${NOCOLOR}"
            mkdir -p $FOLDER
            ln -s $FILE $DEST
            echo -e "${DARKGRAY}--> ${GREEN}Done ✓${NOCOLOR}${NOCOLOR}"
        fi
    fi
done
