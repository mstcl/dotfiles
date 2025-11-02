#!/usr/bin/env zsh

function zcompile-many() {
	local f
	for f; do zcompile -R -- "$f".zwc "$f"; done
}

# :: manage completions
# NOTE: terraform and aws-cli use bashcompinit
COMPLETIONS_DIR="$XDG_DATA_HOME"/zsh/completions
mkdir -p "$COMPLETIONS_DIR"

rg --generate complete-zsh >"$COMPLETIONS_DIR/_rg"
# uv generate-shell-completion zsh >"$COMPLETIONS_DIR/_uv"
# podman completion zsh >"COMPLETIONS_DIR"/_podman
# glab completion -s zsh >"$COMPLETIONS_DIR"/_glab
wget -qnc https://raw.githubusercontent.com/zsh-users/zsh-completions/refs/heads/master/src/_golang -O "$COMPLETIONS_DIR/_golang"
wget -qnc https://raw.githubusercontent.com/zsh-users/zsh-completions/refs/heads/master/src/_age -O "$COMPLETIONS_DIR/_age"
wget -qnc https://raw.githubusercontent.com/zsh-users/zsh-completions/refs/heads/master/src/_direnv -O "$COMPLETIONS_DIR/_direnv"
wget -qnc https://raw.githubusercontent.com/zsh-users/zsh-completions/refs/heads/master/src/_openssl -O "$COMPLETIONS_DIR/_openssl"
just --completions zsh >"$COMPLETIONS_DIR"/_just
tea completion zsh >"$COMPLETIONS_DIR"/_tea

# :: download plugins
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
