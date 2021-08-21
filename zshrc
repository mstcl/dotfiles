# :.config/zsh/.zshrc
# vim:set ft=sh syntax=sh fdm=marker:
#+----------------------------+
#|            _               |
#|    _______| |__  _ __ ___  |
#|   |_  / __| '_ \| '__/ __| |
#|  _ / /\__ \ | | | | | (__  |
#| (_)___|___/_| |_|_|  \___| |
#|                            |
#+----------------------------+

# ANTIGEN {{{
# get plugins and themes
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
    zpm-zsh/colors
    colorize
    copydir
    fancy-ctrl-z
    colored-man-pages
    themes
    sudo
    autojump
    command-not-found
    aubreypwd/zsh-plugin-reload@1.0.0
    hlissner/zsh-autopair
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme spaceship-prompt/spaceship-prompt
antigen apply
# }}}

# SAUCE {{{
# other sourcing that has to be done after certain plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/scripts/other/fzf-tab-completion.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
# }}}

# HISTORY VARIABLES {{{
export HISTSIZE=500000
export SAVEHIST=500000
export HIST_STAMPS="mm/dd/yyyy"
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# }}}

# SPACESHIP PROMPT VARIABLES {{{
export SPACESHIP_PROMPT_ORDER=(
    user
    dir
    host
    char
)
export SPACESHIP_RPROMPT_ORDER=(
    conda
    git
    hg
    package
    gradle
    maven
    node
    ruby
    elixir
    xcode
    swift
    golang
    php
    rust
    haskell
    julia
    docker
    aws
    gcloud
    venv
    pyenv
    dotnet
    ember
    kubectl
    terraform
    jobs
)
export SPACESHIP_TIME_SHOW=false
export SPACESHIP_CHAR_SYMBOL="%F{red}%F{green}%F{blue}%F{green}"
export SPACESHIP_CHAR_PREFIX=""
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_GIT_BRANCH_PREFIX=" "
export SPACESHIP_GIT_STATUS_AHEAD=""
export SPACESHIP_GIT_STATUS_BEHIND=""
export SPACESHIP_CHAR_SYMBOL_SECONDARY="%F{red} "
export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_GIT_BRANCH_COLOR="yellow"
export SPACESHIP_GIT_STATUS_PREFIX=" ["
export SPACESHIP_GIT_STATUS_COLOR="yellow"
export SPACESHIP_GIT_STATUS_ADDED="%F{yellow}+"
export SPACESHIP_GIT_STATUS_UNTRACKED="%F{blue}?"
export SPACESHIP_GIT_STATUS_DELETED="%F{red}"
export SPACESHIP_GIT_STATUS_MODIFIED="%F{green}!%F{yellow}"
# }}}

# ZSH VARIABLES {{{
# ZSH stuff
export CASE_SENSITIVE="false"
export HYPHEN_INSENSITIVE="true"
export DISABLE_AUTO_UPDATE="false"
export DISABLE_UPDATE_PROMPT="false"
export DISABLE_MAGIC_FUNCTIONS="false"
export DISABLE_LS_COLORS="false"
export DISABLE_AUTO_TITLE="false"
export ENABLE_CORRECTION="false"
export COMPLETION_WAITING_DOTS="false"
# Autocomplete highlight brighter
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
# }}}

# DIR VARIABLES {{{
# Custom directories I use often
export CONF="$XDG_CONFIG_HOME"
export DOTS="$HOME"/dotfiles
export TRASH="$XDG_DATA_HOME"/Trash/files
export MANPATH="/usr/share/man"
export SCRIPTS="$HOME"/scripts
export ADOTDIR="$XDG_DATA_HOME"/antigen
export PATH="$HOME/.local/share/applications:$HOME/.local/bin:$HOME/scripts/bin:$PATH"
# }}}

# FZF VARIABLES {{{
# Bat config path
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME"/bat/config
# Default command
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g '!{.git}' -g '!{dosdevices}' -g '!{compatdata}' 2> /dev/null'
export FZF_DEFAULT_OPTS="
    --color fg:8,bg:0,hl:1,fg+:7,bg+:0,hl+:9,gutter:0
    --color border:8,info:5,prompt:2,spinner:3,pointer:6,marker:4
    --height 100%
    --preview-window hidden
    --pointer='->'
    --marker='++'
    --prompt=' '
    --info=default
    --multi --bind 'ctrl-a:select-all'
    --bind '?:toggle-preview'"
# Ctrl-R
export FZF_CTRL_R_OPTS="
    --height 50%
    --layout=reverse
    --border=sharp
    --margin 5%,7%
    --info=hidden
    --prompt=' '
    --preview-window hidden"
# Ctrl-T
export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow -g '!{.git}' -g '!{dosdevices}' -g '!{compatdata}' 2> /dev/null'
export FZF_CTRL_T_OPTS="
    --preview-window nohidden
    --height 50%
    --border=sharp
    --margin 5%,7%
    --layout=reverse
    --prompt=' '
    --preview 'bat --line-range :500 {}'"
# Alt-C
export FZF_ALT_C_OPTS="
    --prompt='נּ '
    --height 50%
    --border=sharp
    --margin 5%,7%
    --layout=reverse
    --preview 'tree -C {} | head -200'
    --preview-window nohidden"
# Completion.zsh
export FZF_COMPLETION_OPTS="
    --info=default
    --height 50%
    --border=sharp
    --margin 5%,7%
    --layout=reverse
    --preview-window nohidden"

# Fzf-tab-completion options
zstyle ':completion::*:nvim::*' fzf-completion-opts --preview='eval bat {1}'
zstyle ':completion::*:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-completion-opts --preview='eval eval echo {1}'
zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'
zstyle ':completion::*:git::*,[a-z]*' fzf-completion-opts --preview='
eval set -- {+1}
for arg in "$@"; do
    { git diff --color=always -- "$arg" | git log --color=always "$arg" } 2>/dev/null
done'
# }}}

# ALIASES {{{
# Nicer sudo prompt
alias sudo='sudo -p " Password: "'

# Check storage when I don't have patience for gdu
alias storage='lsblk -ao NAME,FSTYPE,FSSIZE,FSUSED,FSUSE%'

# Protonvpn with sudo
alias protonvpn='sudo protonvpn'

# Kill pid
alias k='kill -9'

# View svg with feh
alias fsvg="feh --conversion-timeout 4"

# View image with feh
alias view='feh -Z -. -X -g 1280x720'

# Quickly return home
alias .!='cd $HOME'

# Update mirror
alias get-mirror='systemctl start reflector'

# Vim habits
alias q='exit'

# Nvim aliases
alias nv='nvim'
alias vim='nvim'
alias v='nvim'

# Stop fucking cluttering my home
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget/history"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# Conda
alias condact="conda activate"

# Ls but better
alias l='colorls --gs --sd -C'
alias lt='colorls --sd --tree=2'
alias la='colorls --gs -loa --sd'

# Holy grail command ???
alias fetch='neofetch --backend $1'

# Edit configs
alias zshconf='nvim ~/dotfiles/zshrc'
alias i3conf='nvim ~/dotfiles/i3-config.conf'
alias kittyconf='nvim ~/dotfiles/kitty.conf'
alias vimconf='nvim ~/dotfiles/nvim-init.vim'
alias polyconf='nvim ~/scripts/polybar/bar'

# Find files to edit
alias fv='nvim $(fzf --height 40% --preview-window=nohidden --height=50% --border=sharp --margin=5%,7% --layout=reverse --marker="++" --prompt=" " --preview="bat --line-range :500 {}")'

# Tile current wallpaper
alias tilewall='feh --bg-tile ~/.config/wpg/.current'

# Sudo commands
alias sunv='sudo -E nvim $1'
alias sue='sudo -E $1'

# I don't want to fuck my system up
alias mv='mv -i'
alias rm='rm -i'
alias rmv='trash-put'

# Weather
alias wth='_weather() { curl -s wttr.in/“${1:-bristol}” | head -n 7 ;}; _weather'

# Paru helper
alias pu='paru -Syu --removemake'
alias pusu='paru -Syu --noconfirm --removemake'
alias pfetch='paru -Ps'
alias pcom='paru -Gc'
alias pnews='paru -Pw'
alias pid='paru -U'
alias pir='paru -S'
alias pnd='paru -Qi'
alias pnr='paru -Si'
alias pfd='paru -Ss'
alias pfr='paru -Qs'
alias pls='paru -Q'
alias plsa='paru -Qe'
alias porf='paru -Qdt'
alias pcc='paru -Scd'
# }}}

# CONDA {{{
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lckdscl/.local/share/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lckdscl/.local/share/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lckdscl/.local/share/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lckdscl/.local/share/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# }}}

# FUNCTIONS {{{
# Change fzf-completion commands
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" . "$1"
}

# When I short circuit while doing an autojump
function j {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height=40% --prompt=" " --margin=5%,7% --border=sharp --reverse --inline-info --preview-window=hidden)"
}

# Paru fuzzy install
function ins {
    paru -Slq | fzf --height 40% --reverse --margin=5%,7% --multi --border=sharp --prompt=" " --preview-window=hidden --preview 'paru -Si {1}' | xargs -ro paru -S --removemake --cleanafter
}

# Paru fuzzy remove
function rem() {
    paru -Qq | fzf -q "$1" --height=40% --reverse --margin=5%,7% --multi --border=sharp --prompt=" " --preview-window=hidden --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}

# Tldr fuzzy
function cheat() {
    if [[ "$#" -ne 0 ]]; then
        tldr $@
        return
        #fzf_args="-q $*"
    fi
    tldr --list | fzf -q "$1" --reverse --prompt=' ' --preview-window=nohidden,80% --border=sharp --preview "echo {} | xargs tldr --color always" | xargs -r tldr
}

# Custom jump to dir for vm()
function jd() {
    fd --type d --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" | sed 's@^\./@@' | fzf --prompt="נּ " --height=40% --reverse --margin=5%,7% --preview-window=hidden --border=sharp
}

# Hop to dir with vifm from commandline
function vm {
    if [[ "$#" -ne 0 ]]; then
        vifm $@
        return
    fi
    vifm $(jd)
}
# }}}
