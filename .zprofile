# LOGIN ENVIRONMENTAL VARIABLES

###########
#  CHECK  #
###########


export DID_ZPROFILE_RUN="yes"

##############
#  EXTERNAL  #
##############

export TRASH="$XDG_DATA_HOME"/Trash/files

export MANGOHUD=0
export ENABLE_VKBASALT=0
export _GL_SYNC_DISPLAY_DEVICE=DP-2
export VDPAU_DRIVER=nvidia
export LIBVA_DRIVER_NAME=vdpau

export BROWSER="/usr/bin/vivaldi-snapshot"
export TERMINAL="/usr/bin/wezterm"

export MANPAGER="nvim +Man!"
export DIFFPROG=nvim
export EDITOR=/usr/bin/glrnvim
export PAGER="nvim -R"
export MANPATH="/usr/share/man"

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=ibus

export QT_QPA_PLATFORMTHEME=gtk2

#########
#  X11  #
#########

export XCURSOR_THEME=phinger-cursors
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons

###################
#  XDG-BASE JAIL  #
###################

export W3M_DIR="$XDG_STATE_HOME/w3m"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
# export SDCV_PAGER='less --quit-if-one-screen -RX'
# export WORDCHARS=${WORDCHARS//\/}
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export _JAVA_OPTIONS=-Djavafx.cachedir="$XDG_CACHE_HOME"/openjfx
export ADOTDIR="$XDG_DATA_HOME"/antigen
export CONAN_USER_HOME="$XDG_CONFIG_HOME"/conan
export ANDROID_HOME="$XDG_DATA_HOME"/android
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql/mysql_history
export PYTHONSTARTUP="/etc/python/pythonrc"
export GOPATH="$XDG_DATA_HOME"/go
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
# export IPFS_PATH="$XDG_DATA_HOME"/ipfs
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export STACK_ROOT="$XDG_DATA_HOME"/stack
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export ADOTDIR="$XDG_DATA_HOME"/antigen
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME"/bat/config

##########################
#  PATHS & FINAL CHECKS  #
##########################

umask 022
append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'
append_path "$HOME/.local/share/applications"
append_path "$HOME/.local/bin:$HOME/scripts/bin"
append_path "$HOME/.local/share/cargo/bin:$PATH"

export PATH

if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

unset -f append_path

if test "$BASH" &&\
   test "$PS1" &&\
   test -z "$POSIXLY_CORRECT" &&\
   test "${0#-}" != sh &&\
   test -r /etc/bash.bashrc
then
	. /etc/bash.bashrc
fi

unset TERMCAP

unset MANPATH
