# :.config/zsh/.functions
# vim:set fdm=marker foldenable ft=zsh foldlevel=0:

# Double Escape to sudo current line {{{
sudo-command-line() {
[[ -z $BUFFER ]] && zle up-history
if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
elif [[ $BUFFER == $EDITOR\ * ]]; then
    LBUFFER="${LBUFFER#$EDITOR }"
    LBUFFER="sudoedit $LBUFFER"
elif [[ $BUFFER == sudoedit\ * ]]; then
    LBUFFER="${LBUFFER#sudoedit }"
    LBUFFER="$EDITOR $LBUFFER"
else
    LBUFFER="sudo $LBUFFER"
fi
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line
bindkey -M vicmd '\e\e' sudo-command-line
# }}}
# Make Ctrl-z also resume background process {{{
fancy-ctrl-z () {
if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
else
    zle flush-input
    zle clear-screen
fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
# }}}
# Mkdir and then cd into it {{{
function mkcd
{
    command mkdir $1 && cd $1
}
# }}}
# Git commit {{{
gcm() {
    echo -e "Enter commit message:"
    message=""
    while [ -z "$message" ]
    do
        IFS= read -r message
        wait
        sleep 1
    done
    git commit -m "$message"
    message=""
}
# }}}
# Change fzf-completion commands {{{
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" . "$1"
}
# }}}
# Paru fuzzy install {{{
function ins {
    paru -Slq | fzf --height=80% --prompt="↓ " --preview-window=hidden --preview 'paru -Si {1}' | xargs -ro paru -S --removemake --cleanafter
}
# }}}
# Paru fuzzy remove {{{
function rem() {
    paru -Qq | fzf -q "$1" --height=80% --prompt="✘ " --preview-window=hidden --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}
# }}}
# Tldr fuzzy {{{
function tl() { if [[ "$#" -ne 0 ]]; then
        tldr $@
        return
    fi
    tldr --list | fzf -q "$1" --preview-window=nohidden,80%  --preview "echo {} | xargs tldr --color always" | xargs -r tldr
}
# }}}
# FZF select + execute history {{{
fzf-history-widget-accept() {
    fzf-history-widget
    zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^R^R' fzf-history-widget-accept
# }}}
# Ripgrep in file {{{
fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    rg --files-with-matches --no-messages "$1" | fzf --preview-window=nohidden --prompt="❯❯ RIPGREP " --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}
# }}}
# Neovim {{{
function nvm() {
    prc=$(ps -ef | grep glrnvim | wc -l)
    if [[ "$prc" -le 1 ]] then
        if [[ "$#" -eq 0 ]]; then
            i3-msg workspace "11:A" > /dev/null && NVIM_LISTEN_ADDRESS=/tmp/nvimsocket glrnvim -c "Alpha"
            return
        else
            i3-msg workspace "11:A" > /dev/null && NVIM_LISTEN_ADDRESS=/tmp/nvimsocket glrnvim $@
            return
        fi
    else
        /usr/bin/nvr --remote $@
        return
    fi
}
# }}}
# Dasht {{{
function ffdash() {
    dasht-query-line $@ | perl -0777 -pe 's/name = (.*?)\ntype = (.*?)\nfrom = (.*?)\nurl = (.*?)\n/ $4 | $1 | $3 | $3\n\n/g' | column -ts'|' | fzf --no-sort --with-nth=2.. --bind 'enter:execute(w3m {1})+accept'
}
# }}}
# SDCV define word {{{
# function def() {
#     sdcv -2 '.local/share/dic' -n --utf8-output --color "$@" 2>&1 | \
#     fold --width=$(tput cols) | \
#     less --quit-if-one-screen -RX
# }
# }}}
