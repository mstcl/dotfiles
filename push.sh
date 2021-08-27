#!/bin/bash
CURRENTDIR=$PWD
DOTDIR=$HOME/dotfiles
USERSTYLEDIR=$HOME/scripts/userstyles
SCRIPTDIR=$HOME/scripts
CSS=$HOME/.config/BetterDiscord/themes/pywal-discord-default.theme.css
SNIPS=$HOME/.config/nvim/ultisnips

cat .bpytop-replace.conf > bpytop.conf
cat .termshark-replace.toml > termshark.toml

echo "==> Copying nvim snippets... "
cp -R $SNIPS/ $DOTDIR/
echo "==> Copying Discord userstyles... "
cp $USERSTYLEDIR/template.user.css $USERSTYLEDIR/pywal.user.css
cat "$CSS" >> "$USERSTYLEDIR/pywal.user.css" && echo "}" >> $USERSTYLEDIR/pywal.user.css
echo "  -> Done."
echo "==> Copying wpgtk templates..."
cp -R $HOME/.config/wpg/templates $SCRIPTDIR
echo "  -> Done."
echo "==> Copying scripts to repository"
cp -R $SCRIPTDIR $DOTDIR
echo "  -> Done."
echo "==> Changing working directory and performing git actions..."
cd $DOTDIR
echo "==> Printing git status..."
git status
message=""
echo "==> Enter commit message... "
while [ -z "$message" ]
do
    IFS= read -r message
    wait
    sleep 1
done
git add . && git commit -m "$message"
git push -u origin main
git push backup main
echo "  -> Done, returning to original directory..."
cd $CURRENTDIR
