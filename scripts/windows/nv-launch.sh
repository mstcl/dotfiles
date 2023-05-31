#!/usr/bin/env bash

i3-msg workspace "11:A" && NVIM_LISTEN_ADDRESS=/tmp/nvimsocket glrnvim -c "Alpha"

