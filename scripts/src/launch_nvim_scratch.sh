#!/usr/bin/zsh

tmp_file=$(mktemp)
nvim -c startinsert -c 'setlocal spell' -c 'set ft=markdown' ${tmp_file}
wl-copy -n <${tmp_file}
