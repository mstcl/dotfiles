#!/bin/bash

FZF_HEIGHT="100%"
export FZF_DEFAULT_OPTS="
    --color fg:#574b42,bg:8,hl:2,fg+:7,bg+:#bdb1a8,hl+:9
    --color gutter:8,scrollbar:#574b42,label:1
    --color border:8,info:#574b42,prompt:1,spinner:2
    --color pointer:1,marker:#574b42,separator:8,header:1
    --color preview-bg:#ded8d3,preview-border:#ded8d3
    --color preview-scrollbar:8,preview-label:1
    --height ~$FZF_HEIGHT
    --info=inline-right
    --scrollbar='▓'
    --preview-window hidden:border-sharp
    --pointer='▌'
    --marker='▎'
    --prompt=' ➤ '
    --tabstop=4
    --layout=reverse
    --margin=0,0
    --padding=0,0
    --border=top
    --border-label='Launcher'
    --bind 'enter:accept'
    --bind 'alt-i:accept'
    --bind 'tab:down'
    --bind 'shift-tab:up'"

i3-dmenu-desktop --dmenu="fzf"
