#!/bin/bash

export PROTON_ENABLE_HDR=0
export PROTON_ENABLE_WAYLAND=0
export PROTON_NO_WM_DECORATION=0

exec game-performance mangohud "$@"
