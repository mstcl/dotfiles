#!/usr/bin/env bash

FZF_HEIGHT="100%"
export FZF_DEFAULT_OPTS="
    --color fg:7,bg:0,hl:2,fg+:7,bg+:8,hl+:9
    --color gutter:0,scrollbar:7,label:7:bold
    --color border:8,info:7,prompt:1,spinner:2
    --color pointer:1,marker:7,separator:8,header:1
    --color preview-bg:0,preview-border:8
    --color preview-scrollbar:8,preview-label:1
    --height=$FZF_HEIGHT
    --min-height=30
    --info=default
    --no-scrollbar
    --preview-window nohidden:border-sharp:down:4
    --preview-label='Information'
    --pointer='▌'
    --marker='▎'
    --prompt=' → '
    --highlight-line
    --tabstop=4
    --layout=reverse
    --margin=0,0
    --padding=0,0
    --border=top
    --bind '?:toggle-preview'
    --bind 'tab:down'
    --bind 'shift-tab:up'"
