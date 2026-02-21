#!/usr/bin/env bash

set -euo pipefail

# :: directories
XDG_CONFIG_HOME="${HOME}/.config"
DOTFILES_DIR="${HOME}/dotfiles"
BIN_DIR="${HOME}/.local/bin"

# :: ensure dirs exist
setup_directories() {
	ln -sfn /tmp "${HOME}/downloads"
	mkdir -p "${XDG_CONFIG_HOME}"
	mkdir -p "${BIN_DIR}"
	mkdir -p "${HOME}/.terraform.d/plugin-cache"
	mkdir -p "${HOME}/pictures"
	mkdir -p "${HOME}/documents"
	mkdir -p "${HOME}/certs"
	mkdir -p "${HOME}/secret"
	mkdir -p "${HOME}/opencode"
	echo "[INFO] directories setup completed"
}

# :: setup all symlinks (special, config, dotfiles, scripts)
setup_symlinks() {
	# :: special symlinks
	ln -sfn "${DOTFILES_DIR}/.config/nvim" "${XDG_CONFIG_HOME}/nvim" || true
	ln -sfn "${DOTFILES_DIR}/.config/zsh/.zshenv" "${HOME}/.zshenv" || true
	ln -sfn "${DOTFILES_DIR}/.config/zsh" "${XDG_CONFIG_HOME}/zsh" || true
	ln -sfn "${DOTFILES_DIR}/.config/systemd" "${XDG_CONFIG_HOME}/systemd" || true
	ln -sfn "${DOTFILES_DIR}/.config/opencode/themes" "${XDG_CONFIG_HOME}/opencode/themes" || true
	ln -sfn "${DOTFILES_DIR}/.config/opencode/agents" "${XDG_CONFIG_HOME}/opencode/agents" || true
	ln -sfn "${DOTFILES_DIR}/.config/opencode/opencode.jsonc" "${XDG_CONFIG_HOME}/opencode/opencode.jsonc" || true
	ln -sfn "/hades/pictures/screenshots" "${HOME}/pictures/screenshots" || true
	echo "[INFO] special symlink completed"

	# :: config symlinks
	ln -sfn "${DOTFILES_DIR}/.config/X11" "${XDG_CONFIG_HOME}/X11" || true
	ln -sfn "${DOTFILES_DIR}/.config/foot" "${XDG_CONFIG_HOME}/foot" || true
	ln -sfn "${DOTFILES_DIR}/.config/bat" "${XDG_CONFIG_HOME}/bat" || true
	ln -sfn "${DOTFILES_DIR}/.config/fd" "${XDG_CONFIG_HOME}/fd" || true
	ln -sfn "${DOTFILES_DIR}/.config/fontconfig" "${XDG_CONFIG_HOME}/fontconfig" || true
	ln -sfn "${DOTFILES_DIR}/.config/git" "${XDG_CONFIG_HOME}/git" || true
	ln -sfn "${DOTFILES_DIR}/.config/niri" "${XDG_CONFIG_HOME}/niri" || true
	ln -sfn "${DOTFILES_DIR}/.config/npm" "${XDG_CONFIG_HOME}/npm" || true
	ln -sfn "${DOTFILES_DIR}/.config/yamlfmt" "${XDG_CONFIG_HOME}/yamlfmt" || true
	ln -sfn "${DOTFILES_DIR}/.config/sway" "${XDG_CONFIG_HOME}/sway" || true
	ln -sfn "${DOTFILES_DIR}/.config/gtk-3.0" "${XDG_CONFIG_HOME}/gtk-3.0" || true
	ln -sfn "${DOTFILES_DIR}/.config/gtk-4.0" "${XDG_CONFIG_HOME}/gtk-4.0" || true
	ln -sfn "${DOTFILES_DIR}/.config/environment.d" "${XDG_CONFIG_HOME}/environment.d" || true
	ln -sfn "${DOTFILES_DIR}/.config/jj" "${XDG_CONFIG_HOME}/jj" || true
	ln -sfn "${DOTFILES_DIR}/.config/mise" "${XDG_CONFIG_HOME}/mise" || true
	echo "[INFO] configuration symlink completed"

	# :: dotfiles symlink
	for src in ${DOTFILES_DIR}/.*; do
		name=$(basename "$src")

		if [[ "$name" == ".envrc" || "$name" == "." || "$name" == ".." || "$name" == ".git" || "$name" == ".config" || "$name" == ".gitignore" ]]; then
			continue
		fi

		target="$HOME/$name"

		if [[ -e "$target" && ! -L "$target" ]]; then
			echo "[INFO] Backing up existing $target -> ${target}.bak"
			mv "$target" "${target}.bak"
		fi

		ln -sfn "$src" "$target"
	done
	echo "[INFO] dotfiles symlink completed"

	# scripts symlink
	find -L ${BIN_DIR} -maxdepth 1 -type l -delete
	ln -sfn "${DOTFILES_DIR}/scripts" "${HOME}/scripts" || true
	for script in ${DOTFILES_DIR}/scripts/src/*.sh; do
		if [[ -f "$script" ]]; then
			script_name=$(basename "$script" .sh)
			ln -sfn "$script" "$BIN_DIR/,$script_name" || true
		fi
	done
	for script in ${DOTFILES_DIR}/scripts/src/*.py; do
		if [[ -f "$script" ]]; then
			script_name=$(basename "$script" .py)
			ln -sfn "$script" "$BIN_DIR/,$script_name" || true
		fi
	done
	echo "[INFO] scripts symlink completed"
}

# TODO: system package installation, including mise

# :: mise setup
setup_mise_tools() {
	eval "$(mise activate bash)"
	mise install -qy --silent 2>/dev/null
	mise run -q --silent python:sync 1>/dev/null
	mise run -q --silent zsh:setup 1>/dev/null
	echo "[INFO] mise setup completed"
}

# :: initalize tools
initialize_tools() {
	# :: bat init
	bat cache --build 1>/dev/null
	echo "[INFO] bat cache updated"
}

# :: cleanup
cleanup() {
	uv cache prune -q || true
	pip cache purge -q 2>/dev/null || true
	npm cache clean --force 2>&1 >/dev/null || true
	echo "[INFO] cleanup completed"
}

# :: entrypoint
main() {
	case "${1:-all}" in
	all)
		setup_directories
		setup_symlinks
		setup_mise_tools
		initialize_tools
		cleanup
		;;
	directories)
		setup_directories
		;;
	symlinks)
		setup_symlinks
		;;
	tools)
		setup_mise_tools
		initialize_tools
		;;
	cleanup)
		cleanup
		;;
	*)
		echo "Usage $0 {all|directories|symlinks|tools|cleanup}"
		echo ""
		echo "Commands:"
		echo "  all         Run full setup (default)"
		echo "  directories Create necessary directories"
		echo "  symlinks    Setup all symlinks"
		echo "  tools       Setup mise tools and initialize"
		echo "  cleanup     Cleanup caches"
		exit 1
		;;
	esac
}

main "$@"
