#!/usr/bin/env bash

set -euo pipefail

PYTHON_VERSION=3.12
VENV_DIR=${HOME}/.venv

uv python install "$PYTHON_VERSION"

mkdir -p "$VENV_DIR"

# --- ansible venv ---
ANSIBLE_VENV=ansible_venv
[ -d "$VENV_DIR/$ANSIBLE_VENV" ] || uv venv --python "$PYTHON_VERSION" "$VENV_DIR/$ANSIBLE_VENV"
source "$VENV_DIR/$ANSIBLE_VENV/bin/activate"
uv pip install -r ${HOME}/dotfiles/requirements.txt
