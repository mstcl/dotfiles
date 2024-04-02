#!/bin/bash
set -eu
set -o pipefail

rbw ls --fields folder,name | sed 's/\t/\//g' | sort | dmenu_default -p "User:" | sed 's/^[^\/]*\///' | sed 's/\// /' | xargs -I {} rbw get --full "{}" | grep "Username" | cut -d" " -f2 | xclip -rmlastnl -selection "clipboard"
