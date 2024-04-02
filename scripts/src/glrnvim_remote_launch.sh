#!/usr/bin/env bash

prc=$(ps -ef | grep glrnvim | wc -l)
echo "$prc"
if [[ "$prc" -le 1 ]] then
    i3-msg workspace "11:A" && NVIM_LISTEN_ADDRESS=/tmp/nvimsocket glrnvim
    if [[ "$#" -ne 0 ]]; then
        /usr/bin/nvr --remote $@
        return
    fi
else
    /usr/bin/nvr --remote $@
    return
fi
