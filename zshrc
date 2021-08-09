# :.config/zsh/.zshrc
#+----------------------------+
#|            _               |
#|    _______| |__  _ __ ___  |
#|   |_  / __| '_ \| '__/ __| |
#|  _ / /\__ \ | | | | | (__  |
#| (_)___|___/_| |_|_|  \___| |
#|                            |
#+----------------------------+


###### ZSH CONFIG #######
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

###### SAUCE #####
source /usr/share/zsh/share/antigen.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /home/lckdscl/.config/broot/launcher/bash/br

###### PLUGINS ######
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
    redxtech/zsh-fzf-utils
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
    Aloxaf/fzf-tab
    hlissner/zsh-autopair
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
    #jeffreytse/zsh-vi-mode
    gretzky/auto-color-ls
EOBUNDLES
#antigen theme zhann
#antigen theme jackharrisonsherlock/common
#antigen theme gozilla
#antigen theme eendroroy/alien-minimal alien-minimal
antigen theme spaceship-prompt/spaceship-prompt
antigen apply
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

###### SPACESHIP PROMPT ######
SPACESHIP_PROMPT_ORDER=(
    user
    dir
    host
    char
)
SPACESHIP_RPROMPT_ORDER=(
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

SPACESHIP_TIME_SHOW=false
SPACESHIP_CHAR_SYMBOL=""
SPACESHIP_CHAR_PREFIX=""
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL_SECONDARY=" "
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false

###### ENVIRONMENTAL VARIABLES #####
export CONF="$XDG_CONFIG_HOME"
export DOTS="$HOME"/dotfiles
export TRASH="$XDG_DATA_HOME"/Trash/files
export MANPATH="/usr/share/man"
export SCRIPTS="$HOME"/scripts
export ADOTDIR="$XDG_DATA_HOME"/antigen
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
export PATH="$HOME/.local/share/applications:$HOME/.local/bin:$HOME/scripts/bin:$PATH"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g '!{.git}' -g '!{dosdevices}' -g '!{compatdata}' 2> /dev/null'
export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:1,fg+:-1,bg+:237,hl+:9
    --color info:5,prompt:2,spinner:3,pointer:2,marker:4
    --height 90%
    --info=default
    --layout=reverse
    --border
    --marker=' '
    --pointer=' '
    --prompt=' '
    --margin 5%
    --multi --bind 'ctrl-a:select-all'
    --border=sharp
    --preview-window=right,hidden,wrap,border-none
    --padding 0%,0%,0%,0%
    --bind '?:toggle-preview'
    --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_CTRL_R_OPTS="
    --height 90%
    --margin 5%
    --padding 0%,0%,0%,0%
    --info=hidden
    --preview-window hidden"
export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow -g '!{.git}' -g '!{dosdevices}' -g '!{compatdata}' 2> /dev/null'
export FZF_CTRL_T_OPTS="
    --preview-window nohidden
"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

###### ALIAS ######
alias storage='lsblk -ao NAME,FSTYPE,FSSIZE,FSUSED,FSUSE%'
alias pr='protonvpn'
alias k='kill -9'
alias view='feh -Z -. -X -g 1280x720'
alias .!='cd $HOME'
alias get-mirror='systemctl start reflector'
alias q='exit'
alias nv='nvim'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget/history"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias condact="conda activate"
alias fsvg="feh --conversion-timeout 4"
alias l='colorls --gs --sd'
alias lt='colorls --sd --tree=2 --gs'
alias la='colorls --gs -l -o -a --sd'
alias fetch='neofetch --backend ascii --source ~/scripts/ascii/cactus'
alias polylaunch='bash ~/scripts/polybar/launch.sh'
alias zshconf='nvim ~/dotfiles/zshrc'
alias i3conf='nvim ~/dotfiles/i3-config.conf'
alias kittyconf='nvim ~/dotfiles/kitty.conf'
alias vimconf='nvim ~/dotfiles/nvim-init.vim'
alias polyconf='nvim ~/scripts/polybar/bar'
alias fv='nvim $(fzf --height 40%)'
alias tilewall='feh --bg-tile ~/.config/wpg/.current'
alias sunv='sudo -E nvim $1'
alias sue='sudo -E $1'
alias mv='mv -i'
alias rm='rm -i'
alias rmv='trash-put'
alias wth='_weather() { curl -s wttr.in/“${1:-bristol}” | head -n 7 ;}; _weather'
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

###### CONDA ######
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

###### FUNCTIONS ######
function j {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)"
}

function ins {
    paru -Slq | fzf --multi --preview-window nohidden --preview 'paru -Si {1}' | xargs -ro paru -S --removemake --cleanafter
}

function rem() {
    paru -Qq | fzf -q "$1" -m --preview-window nohidden --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}

function da() {
    local cid
    cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')
    [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

function ds() {
    local cid
    cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker stop "$cid"
}

function drm() {
    docker ps -a | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
}

function drmi() {
    docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}

function cheat() {
    if [[ "$#" -ne 0 ]]; then
        tldr $@
        return
        #fzf_args="-q $*"
    fi
    tldr --list | fzf -q "$1" --preview-window nohidden --preview "echo {} | xargs tldr --color always" | xargs -r tldr
}

function jd() {
    find -L -path "./.local/share/Steam" -prune -o -path "./.local/share/lutris/runners" -prune -o -path "./.local/share/wineprefixes" -prune -o -path "./.steam" -prune -o -name .git -prune -o -name .hg -prune -o -name .svn -prune -o -type d -a -not -print 2> /dev/null | sed 's@^\./@@' | fzf
}

function vm {
    if [[ "$#" -ne 0 ]]; then
        vifm $@
        return
    fi
    vifm $(jd)
}

###### VI MODE ######
zvm_after_init_commands+=('source /usr/share/fzf/key-bindings.zsh && source /usr/share/fzf/completion.zsh')

