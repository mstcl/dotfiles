# :.zshrc
#+----------------------------+
#|            _               |
#|    _______| |__  _ __ ___  |
#|   |_  / __| '_ \| '__/ __| |
#|  _ / /\__ \ | | | | | (__  |
#| (_)___|___/_| |_|_|  \___| |
#|                            |
#+----------------------------+


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

###### SAUCE #####
source /usr/share/zsh/share/antigen.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/lckdscl/.config/broot/launcher/bash/br

###### PLUGINS ######
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
    redxtech/zsh-fzf-utils
    zpm-zsh/colors
    git
    archlinux
    alias-finder
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
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    gretzky/auto-color-ls
EOBUNDLES
antigen theme zhann
antigen apply
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source /home/lckdscl/.config/broot/launcher/bash/br

###### ENVIRONMENTAL VARIABLES #####
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
export PATH="$HOME/scripts/bin:$PATH"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore-dir=/home/lckdscl/.wine/drive_c --ignore-dir=/home/lckdscl/.local/share/Steam --ignore-dir=/home/lckdscl/.steam --ignore="dosdevices" -g ""'
export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:1,fg+:-1,bg+:237,hl+:9
    --color info:5,prompt:2,spinner:3,pointer:2,marker:4
    --height 40%
    --layout=reverse
    --border
    --preview-window right:hidden:wrap
    --bind '?:toggle-preview'
    --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_CTRL_R_OPTS="
    --height 40%
    --layout=reverse
    --border"
export XCURSOR_THEME=Bibata-Modern-Classic
export MANPATH="/usr/local/man:$MANPATH"

###### ALIAS ######
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias condact="conda activate"
alias gnomesettings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias lc='colorls --gs -l -a --sd'
alias fetch='neofetch --backend ascii --source ~/scripts/ascii/cactus'
# alias protonmail='hydroxide serve &'
# alias todo='cat ~/scripts/todo | cowsay | lolcat'
# alias wally='bash ~/scripts/wal/changewal > /dev/null 2>&1'
alias polylaunch='bash ~/scripts/polybar/launch.sh'
alias zshconf='nvim ~/dotfiles/zshrc'
alias i3conf='nvim ~/dotfiles/i3-config.conf'
alias kittyconf='nvim ~/dotfiles/kitty.conf'
alias vimconf='nvim ~/dotfiles/nvim-init.vim'
alias polyconf='nvim ~/scripts/polybar/bar'
# alias top='sudo -E wal-vtop > /dev/null 2>&1 && vtop --theme wal'
# alias media='sudo mount /dev/sda2 /media'
# alias ipfslaunch='bash ~/scripts/web/ipfs &'
alias fv='nvim $(fzf --height 40%)'
alias tilewall='feh --bg-tile ~/.config/wpg/.current'
alias :q='exit'
alias :Q=':q'
alias sunv='sudo -E nvim $1'
alias sue='sudo -E $1'
alias mv='mv -i'
alias rm='rm -i'
alias rmv='trash-put'

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

###### FZF ######
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept
