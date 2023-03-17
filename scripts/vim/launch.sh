#!/usr/bin/env bash
CURRENTDIR=$PWD
if [ "$#" -ne 0 ]; then
    kitty @ --to unix:/tmp/mykitty launch --type=tab --tab-title "neovim" nvim "$PWD"/$1
    sleep 0.1
    kitty @ --to unix:/tmp/mykitty set-spacing --match title:nvim padding=0
else
    if [ "$#" -eq 0 ]; then
        kitty @ --to unix:/tmp/mykitty launch --type=tab --tab-title "neovim" --cwd "$PWD" nvim -c ":Alpha"
        sleep 0.1
        kitty @ --to unix:/tmp/mykitty set-spacing --match title:nvim padding=0
        kitty @ --to unix:/tmp/mykitty set-font-size 14
        # kitty @ --to unix:/tmp/mykitty set-colors background=#f0f0f0
    fi
fi
