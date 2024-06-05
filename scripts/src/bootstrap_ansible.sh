#!/usr/bin/env sh
#
# Get uv and install a prefix with ansible on it

sudo pacman -S --needed --noconfirm uv
mkdir -p ~/.venv
uv venv ~/.venv/ansible_venv && source ~/.venv/ansible_venv/bin/activate
uv pip install -r ~/dotfiles/requirements.txt
