#!/bin/bash
current_dir=$PWD
cd $HOME/pkb
hugo -D
cd $HOME/pkb/public
git add . && git commit -m "Content update"
git push origin main
cd $current_dir
