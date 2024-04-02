#!/bin/bash
set -eu
set -o pipefail

rbw ls --fields folder,name | sed 's/\t/\//g' | sort | dmenu_default -p "TOTP:" | sed 's/^[^\/]*\///' | sed 's/\// /' | xargs -I {} rbw code "{}" | xclip -rmlastnl -selection "clipboard"
