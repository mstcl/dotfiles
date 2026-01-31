#!/bin/bash

export PROTON_ENABLE_HDR=1
export PROTON_ENABLE_WAYLAND=0
export PROTON_NO_WM_DECORATION=0
export WINEDLLOVERRIDES="d3dcompiler_47=n;dxgi=n,b;dinput8.dll=n,b"

exec game-performance mangohud "$@"
