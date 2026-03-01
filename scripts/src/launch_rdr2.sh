#!/bin/bash

export PROTON_ENABLE_HDR=0
export PROTON_ENABLE_WAYLAND=0
export PROTON_NO_WM_DECORATION=0
export WINEDLLOVERRIDES="dinput8.dll=n,b"
export WINEDLLOVERRIDES=dxgi=n,b
export PROTON_HEAP_DELAY_FREE=1
export DXVK_ASYNC=1
export PULSE_LATENCY_MSEC=60

exec game-performance mangohud "$@" -vulkan -USERALLAVAILABLECORES -cpuLoadRebalancing -ignorepipelinecache
