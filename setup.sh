#!/usr/bin/env bash

set -euo pipefail

# :: directories
DOTFILES_DIR="${HOME}/dotfiles"
CONFIG_DIR="${HOME}/.config"
BIN_DIR="${HOME}/.local/bin"

# :: ensure dirs exist
mkdir -p "${CONFIG_DIR}"
mkdir -p "${HOME}/downloads"
mkdir -p "${BIN_DIR}"
mkdir -p "${HOME}/.terraform.d/plugin-cache"
mkdir -p "${HOME}/pictures"
mkdir -p "${HOME}/certs"
mkdir -p "${HOME}/secret"

# :: init git submodule(s)
git submodule update --recursive --remote --init || true

# :: special symlinks
ln -sfnv "${DOTFILES_DIR}/.config/nvim" "${CONFIG_DIR}/nvim" || true
ln -sfnv "${DOTFILES_DIR}/.config/zsh/.zshenv" "${HOME}/.zshenv" || true
ln -sfnv "${DOTFILES_DIR}/.config/zsh" "${CONFIG_DIR}/zsh" || true
ln -sfnv "/hades/pictures/screenshots" "${HOME}/pictures/screenshots" || true

# :: config symlinks
ln -sfnv "${DOTFILES_DIR}/.config/X11" "${CONFIG_DIR}/X11" || true
ln -sfnv "${DOTFILES_DIR}/.config/alacritty" "${CONFIG_DIR}/alacritty" || true
ln -sfnv "${DOTFILES_DIR}/.config/bat" "${CONFIG_DIR}/bat" || true
ln -sfnv "${DOTFILES_DIR}/.config/dunst" "${CONFIG_DIR}/dunst" || true
ln -sfnv "${DOTFILES_DIR}/.config/fd" "${CONFIG_DIR}/fd" || true
ln -sfnv "${DOTFILES_DIR}/.config/fontconfig" "${CONFIG_DIR}/fontconfig" || true
ln -sfnv "${DOTFILES_DIR}/.config/git" "${CONFIG_DIR}/git" || true
ln -sfnv "${DOTFILES_DIR}/.config/hypr" "${CONFIG_DIR}/hypr" || true
ln -sfnv "${DOTFILES_DIR}/.config/niri" "${CONFIG_DIR}/niri" || true
ln -sfnv "${DOTFILES_DIR}/.config/npm" "${CONFIG_DIR}/npm" || true
ln -sfnv "${DOTFILES_DIR}/.config/waybar" "${CONFIG_DIR}/waybar" || true
ln -sfnv "${DOTFILES_DIR}/.config/gamemode.ini" "${CONFIG_DIR}/gamemode.ini" || true

# :: dotfiles symlink
for src in ${DOTFILES_DIR}/.*; do
	name=$(basename "$src")

	if [[ "$name" == ".envrc" || "$name" == "." || "$name" == ".." || "$name" == ".git" || "$name" == ".config" || "$name" == ".gitignore" ]]; then
		continue
	fi

	target="$HOME/$name"

	if [[ -e "$target" && ! -L "$target" ]]; then
		echo "Backing up existing $target -> ${target}.bak"
		mv "$target" "${target}.bak"
	fi

	ln -sfnv "$src" "$target"
done

# scripts symlink
find -L ${BIN_DIR} -maxdepth 1 -type l -delete
ln -sfnv "${DOTFILES_DIR}/scripts" "${HOME}/scripts" || true

for script in ${DOTFILES_DIR}/scripts/src/*.sh; do
	if [[ -f "$script" ]]; then
		script_name=$(basename "$script" .sh)
		ln -sfnv "$script" "$BIN_DIR/$script_name" || true
	fi
done

# TODO: package installation
# yay -Syy

# :: bat init
bat cache --build
