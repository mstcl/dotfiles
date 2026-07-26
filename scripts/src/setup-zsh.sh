#!/usr/bin/env zsh

set -euo pipefail

function zcompile-many() {
	local f
	for f; do zcompile -R -- "$f".zwc "$f"; done
}

# :: manage completions
# NOTE: terraform and aws-cli use bashcompinit
function completions() {
	COMPLETIONS_DIR="$XDG_DATA_HOME"/zsh/completions
	mkdir -p "$COMPLETIONS_DIR"

	(( ${+commands[mise]} )) && mise completion zsh >"$COMPLETIONS_DIR"/_mise
	(( ${+commands[tenv]} )) && tenv completion zsh >"$COMPLETIONS_DIR/_tenv"
	(( ${+commands[rg]} )) && rg --generate complete-zsh >"$COMPLETIONS_DIR/_rg"
	(( ${+commands[uv]} )) && uv generate-shell-completion zsh >"$COMPLETIONS_DIR/_uv"
	(( ${+commands[podman]} )) && podman completion zsh >"$COMPLETIONS_DIR/_podman"
	(( ${+commands[docker]} )) && docker completion zsh >"$COMPLETIONS_DIR/_docker"
	(( ${+commands[glab]} )) && glab completion -s zsh >"$COMPLETIONS_DIR/_glab"
	(( ${+commands[wget]} )) && wget -q https://raw.githubusercontent.com/zsh-users/zsh-completions/refs/heads/master/src/_golang -O "$COMPLETIONS_DIR/_golang"
	(( ${+commands[wget]} )) && wget -q https://raw.githubusercontent.com/zsh-users/zsh-completions/refs/heads/master/src/_age -O "$COMPLETIONS_DIR/_age"
	(( ${+commands[wget]} )) && wget -q https://raw.githubusercontent.com/zsh-users/zsh-completions/refs/heads/master/src/_direnv -O "$COMPLETIONS_DIR/_direnv"
	(( ${+commands[wget]} )) && wget -q https://raw.githubusercontent.com/zsh-users/zsh-completions/refs/heads/master/src/_openssl -O "$COMPLETIONS_DIR/_openssl"
	(( ${+commands[just]} )) && just --completions zsh >"$COMPLETIONS_DIR/_just"
	(( ${+commands[jj]} )) && jj util completion zsh >"$COMPLETIONS_DIR/_jj"
	(( ${+commands[osc]} )) && osc completion zsh >"$COMPLETIONS_DIR/_osc"
	(( ${+commands[tea]} )) && tea completion zsh >"$COMPLETIONS_DIR/_tea"
	echo "[INFO] completions setup completed"
}

# :: download plugins
function plugins() {
	PLUGINS_DIR="$XDG_DATA_HOME"/zsh/plugins
	mkdir -p "$PLUGINS_DIR"

	# :: zsh-defer
	if [[ ! -e "$PLUGINS_DIR"/zsh-defer ]]; then
		git clone --branch master --depth 1 https://github.com/romkatv/zsh-defer "$PLUGINS_DIR"/zsh-defer
	fi

	# :: autosuggestion
	if [[ ! -e "$PLUGINS_DIR"/zsh-autosuggestions ]]; then
		git clone -q --branch master --depth 1 https://github.com/zsh-users/zsh-autosuggestions "$PLUGINS_DIR"/zsh-autosuggestions
	else
		git -C "$PLUGINS_DIR"/zsh-autosuggestions pull
	fi
	zcompile-many "$PLUGINS_DIR"/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}

	# :: fast syntax highlighting
	if [[ ! -e "$PLUGINS_DIR"/fast-syntax-highlighting ]]; then
		git clone -q --branch master --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting "$PLUGINS_DIR"/fast-syntax-highlighting
	else
		git -C "$PLUGINS_DIR"/fast-syntax-highlighting pull
	fi

	# :: autopair
	if [[ ! -e "$PLUGINS_DIR"/zsh-autopair ]]; then
		git clone -q --branch master --depth 1 https://github.com/hlissner/zsh-autopair "$PLUGINS_DIR"/zsh-autopair
	else
		git -C "$PLUGINS_DIR"/zsh-autopair pull
	fi
	zcompile-many "$PLUGINS_DIR"/zsh-autopair/autopair.zsh

	# :: p10k prompt
	if [[ ! -e "$PLUGINS_DIR"/powerlevel10k ]]; then
		git clone -q --branch master --depth 1 https://github.com/romkatv/powerlevel10k "$PLUGINS_DIR"/powerlevel10k
	else
		git -C "$PLUGINS_DIR"/powerlevel10k pull
	fi
	make -C "$PLUGINS_DIR"/powerlevel10k pkg

	# :: window title
	if [[ ! -e "$PLUGINS_DIR"/zsh-window-title ]]; then
		git clone -q --branch main --depth 1 https://github.com/olets/zsh-window-title "$PLUGINS_DIR"/zsh-window-title
	else
		git -C "$PLUGINS_DIR"/zsh-window-title pull
	fi
	zcompile-many "$PLUGINS_DIR"/zsh-window-title/zsh-window-title.zsh

	# :: fzf-tab
	if [[ ! -e "$PLUGINS_DIR"/fzf-tab ]]; then
		git clone -q --branch master --depth 1 https://github.com/Aloxaf/fzf-tab "$PLUGINS_DIR"/fzf-tab
	else
		git -C "$PLUGINS_DIR"/fzf-tab pull
	fi
	zcompile-many "$PLUGINS_DIR"/fzf-tab/fzf-tab.zsh

	# :: fzf-tab-source
	if [[ ! -e "$PLUGINS_DIR"/fzf-tab-source ]]; then
		git clone -q --branch main --depth 1 https://github.com/Freed-Wu/fzf-tab-source "$PLUGINS_DIR"/fzf-tab-source
	else
		git -C "$PLUGINS_DIR"/fzf-tab-source pull
	fi
	zcompile-many "$PLUGINS_DIR"/fzf-tab-source/{sources/*.zsh,functions/*.zsh}

	# :: zsh-histdb
	if [[ ! -e "$PLUGINS_DIR"/zsh-histdb ]]; then
		git clone -q --branch master --depth 1 https://github.com/larkery/zsh-histdb "$PLUGINS_DIR"/zsh-histdb
	else
		git -C "$PLUGINS_DIR"/zsh-histdb pull
	fi
	zcompile-many "$PLUGINS_DIR"/zsh-histdb/sqlite-history.zsh

	# :: zsh-histdb-fzf
	if [[ ! -e "$PLUGINS_DIR"/zsh-histdb-fzf ]]; then
		git clone -q --branch master --depth 1 https://github.com/mstcl/zsh-histdb-fzf "$PLUGINS_DIR"/zsh-histdb-fzf
	else
		git -C "$PLUGINS_DIR"/zsh-histdb-fzf pull
	fi
	zcompile-many "$PLUGINS_DIR"/zsh-histdb-fzf/fzf-histdb.zsh

	echo "[INFO] plugins setup completed"
}

# :: main
case "${1:-}" in
completions)
	completions
	;;
plugins)
	plugins
	;;
all)
	completions
	plugins
	;;
*)
	echo "Usage: $0 {completions|plugins|all}"
	exit 1
	;;
esac
