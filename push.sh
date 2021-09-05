#!/bin/bash
CURRENTDIR=$PWD
DOTDIR=$HOME/dotfiles
USERSTYLEDIR=$HOME/scripts/userstyles
SCRIPTDIR=$HOME/scripts
CSS=$HOME/.config/BetterDiscord/themes/pywal-discord-default.theme.css
SNIPS=$HOME/.config/nvim/ultisnips
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

echo -e "${DARKGRAY}==>${YELLOW} Copying nvim snippets... "
cp -R $SNIPS/ $DOTDIR/
echo -e "${DARKGRAY}  ->${GREEN} Done."
echo -e "${DARKGRAY}==>${YELLOW} Copying Discord userstyles... "
cp $USERSTYLEDIR/template.user.css $USERSTYLEDIR/pywal.user.css
cat "$CSS" >> "$USERSTYLEDIR/pywal.user.css" && echo "}" >> $USERSTYLEDIR/pywal.user.css
echo -e "${DARKGRAY}  ->${GREEN} Done."
echo -e "${DARKGRAY}==>${YELLOW} Copying wpgtk templates..."
cp -R $HOME/.config/wpg/templates $SCRIPTDIR
echo -e "${DARKGRAY}  ->${GREEN} Done."
echo -e "${DARKGRAY}==>${YELLOW} Copying scripts to repository"
cp -R $SCRIPTDIR $DOTDIR
echo -e "${DARKGRAY}  ->${GREEN} Done."
echo -e "${DARKGRAY}==>${YELLOW} Would you like to perform git actions now? [y/n]${WHITE}"
read -p "Answer: " prompt
if [[ "$prompt" == "y" ]]
then
    echo -e "${DARKGRAY}==>${YELLOW} Changing working directory and performing git actions..."
    cd $DOTDIR
    echo -e "${DARKGRAY}==>${YELLOW} Printing git status...${NOCOLOR}"
    git status
    message=""
    echo -e "${DARKGRAY}==>${YELLOW} Enter commit message...${WHITE}"
    while [ -z "$message" ]
    do
        IFS= read -r message
        wait
        sleep 1
    done
    echo -e "${NOCOLOR}"
    git add . && git commit -m "$message"
    git push -u origin main
    git push backup main
else
    if [[ "$prompt" == "n" ]]
    then
        echo -e "${DARKGRAY}  ->${YELLOW} Okay, remember to review the changes then."
    fi
fi

echo -e "${DARKGRAY}  ->${YELLOW} Done, returning to original directory..."
cd $CURRENTDIR
