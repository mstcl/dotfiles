#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

BAT=$(echo "$(acpi --battery --details | head -n 1 | cut -d ':' -f2 | cut -d ' ' -f2,3,4 | cut -d ',' -f1,2)")
# UPDATE=$(echo "$(checkupdates | wc -l)")
TIME=$(echo "$(date +%T | cut -d ':' -f1,2) $(date +%A) $(date +%D)")
notify-send "  Battery" "$BAT"
notify-send "  It is" "$TIME"
bash ~/scripts/other/tasknotify.sh
# notify-send "Updates" "$UPDATE"
