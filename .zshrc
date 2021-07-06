
###### ZSH CONFIG #######

ZSH_THEME="zhann"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="false"
DISABLE_UPDATE_PROMPT="false"
DISABLE_MAGIC_FUNCTIONS="false"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
HIST_STAMPS="mm/dd/yyyy"

###### PLUGINS ######

plugins=(
	git
	alias-finder
	archlinux
	colorize
	copyfile
	copydir
	fancy-ctrl-z
	colored-man-pages
	command-not-found
	zsh_reload
	themes
	sudo
)

###### ENVIRONMENTAL VARIABLES #####

export ZSH="/home/lckdscl/.oh-my-zsh"
##---##
export UPDATE_ZSH_DAYS=5
##---##
export EDITOR=nvim
##---##
export PATH="$HOME/.local/bin:$HOME/.local/share/applications:$HOME/.local/share/hydroxide:$HOME/.cargo/bin:$PATH"
##---##
export QT_QPA_PLATFORMTHEME=qt5ct
##---##
export FZF_DEFAULT_COMMAND='ag --hidden --ignore-dir=/home/lckdscl/.wine/drive_c --ignore-dir=/home/lckdscl/.local/share/Steam --ignore-dir=/home/lckdscl/.steam --ignore="dosdevices" -g ""'
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--height 40% --layout=reverse --border --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
##---##
export XCURSOR_THEME=Bibata-Modern-Classic
##---##
__GL_THREADED_OPTIMIZATION=1
__GL_SHADER_DISK_CACHE=1
__GL_SHADER_DISK_CACHE_PATH=/home/lckdscl/shader-cache
##---##
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

###### ALIAS ######

alias gnomesettings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias ll='ls -al'
alias scrshot='bash ~/scripts/scrshot'
alias fetch='neofetch --backend ascii --source ~/scripts/ascii/cactus'
alias protonmail='hydroxide serve &'
alias todo='cat ~/scripts/todo | cowsay | lolcat'
alias wally='bash ~/scripts/wal/changewal > /dev/null 2>&1'
alias polylaunch='bash ~/scripts/polybar/launch.sh'
alias zshconf='nvim ~/dotfiles/.zshrc'
alias i3conf='nvim ~/dotfiles/.i3-config'
alias kittyconf='nvim ~/dotfiles/.kitty.conf'
alias vimconf='nvim ~/dotfiles/.init.vim'
alias polyconf='nvim ~/scripts/polybar/bar'
alias top='sudo -E wal-vtop > /dev/null 2>&1 && vtop --theme wal'
alias media='sudo mount /dev/sda2 /media'
alias ipfslaunch='bash ~/scripts/web/ipfs &'
alias fv='nvim $(fzf --height 40%)'


###### CONDA ######

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lckdscl/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lckdscl/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lckdscl/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lckdscl/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

###### FZF ######

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

###### SAUCE #####

source $ZSH/oh-my-zsh.sh
##---##
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
##---##
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
##---##
source /home/lckdscl/.config/broot/launcher/bash/br
