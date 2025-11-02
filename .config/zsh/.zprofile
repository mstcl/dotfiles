# :: env vars / directories
export XDG_DATA_DIRS="$HOME/.local/share:/usr/share:/usr/local/share"
export TRASH="$XDG_DATA_HOME/Trash/files"
export VENV_DIR="$HOME/.venv"

# :: env vars / package configuration
export FREETYPE_PROPERTIES="cff:no-stem-darkening=0"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/config"
export ZK_NOTEBOOK_DIR="$HOME/projects/wiki"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# :: env vars / display/graphics
export _GL_SYNC_DISPLAY_DEVICE="DP-2"
export VDPAU_DRIVER="nvidia"
export LIBVA_DRIVER_NAME="nvidia"

# :: env vars / defaults
export BROWSER="/usr/bin/firefox"
export MANPAGER="/usr/bin/nvim +Man!"
export DIFFPROG="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"
export PAGER="bat"
export BAT_PAGER="/usr/bin/less -RF"

# :: env vars / don't trash my home
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export _JAVA_OPTIONS="-Djavafx.cachedir=$XDG_CACHE_HOME/openjfx"
export JAVA_HOME="$XDG_DATA_HOME/nvim/mason/packages/ltex-ls/ltex-ls-16.0.0/jdk-11.0.12+7"
export CONAN_USER_HOME="$XDG_CONFIG_HOME/conan"
export ANDROID_HOME="$XDG_DATA_HOME/android"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql/mysql_history"
export PYTHONSTARTUP="/etc/python/pythonrc"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export ANSIBLE_GALAXY_CACHE_DIR="$XDG_CACHE_HOME/ansible/galaxy_cache"
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export XCURSOR_PATH="/usr/share/icons:$XDG_DATA_HOME/icons"
export MYPY_CACHE_DIR="$XDG_CACHE_HOME/mypy"
export KERAS_HOME="$XDG_STATE_HOME/keras"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"

# :: setup PATH
umask 022
append_path() {
	case ":$PATH:" in
	*:"$1":*) ;;
	*)
		PATH="${PATH:+$PATH:}$1"
		;;
	esac
}

append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'
append_path "$HOME/.local/share/applications"
append_path "$HOME/.local/bin"
append_path "$HOME/bin"
append_path "$HOME/scripts/bin"
append_path "$CARGO_HOME/bin"
append_path "$GOPATH/bin"
append_path "$HOME/.local/share/nvim/mason/bin/"

export PATH

if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

unset -f append_path

if test "$BASH" &&
	test "$PS1" &&
	test -z "$POSIXLY_CORRECT" &&
	test "${0#-}" != sh &&
	test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

unset TERMCAP
