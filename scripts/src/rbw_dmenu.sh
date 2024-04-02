#!/bin/bash
set -eu
set -o pipefail

rbw ls --fields folder,name | sed 's/\t/\//g' | sort | dmenu_default -p "Password:" | sed 's/^[^\/]*\///' | sed 's/\// /' | xargs -I {} rbw get "{}" | xclip -rmlastnl -selection "clipboard"
