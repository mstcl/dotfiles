#!/usr/bin/env bash

set -euo pipefail

PYTHON_VERSION=3.12
VENV_DIR=${HOME}/.venv

uv python install -q "$PYTHON_VERSION"

mkdir -p "$VENV_DIR"

# --- default venv ---
DEFAULT_VENV=default
[ -d "$VENV_DIR/$DEFAULT_VENV" ] || uv venv -q --python "$PYTHON_VERSION" "$VENV_DIR/$DEFAULT_VENV"
source "$VENV_DIR/$DEFAULT_VENV/bin/activate"
uv pip install -q -r ${HOME}/dotfiles/requirements.txt
