# :.config/zsh/.fzf
# vim:set fdm=marker foldenable ft=zsh foldlevel=0:

# Default command {{{
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --follow -g '!{dosdevices}' -g '!{compatdata}' 2> /dev/null'
export FZF_DEFAULT_OPTS="
    --color fg:8,bg:#f5f5f5,hl:1,fg+:7,bg+:#f5f5f5,hl+:9,gutter:#f5f5f5
    --color border:8,info:5,prompt:2,spinner:3,pointer:6,marker:4,separator:8
    --height 100%
    --no-separator
    --preview-window hidden:border-rounded
    --pointer='->'
    --marker='＋'
    --prompt=' FZF '
    --layout=reverse
    --border=none
    --margin 1,0%
    --info=default
    --multi
    --bind '?:toggle-preview'
    --bind 'space:select+unix-line-discard'
    --bind 'alt-j:toggle-out'
    --bind 'alt-k:toggle-in'
    --bind 'alt-i:accept'
    --bind 'alt-u:toggle'
    --bind 'alt-a:toggle-all'
    --bind 'tab:down'
    --bind 'shift-tab:up'"
# }}}
# Ctrl-R {{{
export FZF_CTRL_R_OPTS="
    --height 50%
    --info=hidden
    --prompt=' HISTORY '
    --preview-window hidden
    --bind 'space:unbind(space)'"
# }}}
# Ctrl-T {{{
export FZF_CTRL_T_COMMAND='rg --files --hidden --no-ignore --follow -g '!{go/}*' -g '!{.cmake/}*' -g '!{.steam/}*' -g '!{.android/}*' -g '!{.nuget/}*' -g '!{.var/}*' -g '!{.gnome/}*' -g '!{.pvpn-cli/}*' -g '!{.pki}' -g '!{.gnupg/}*' -g '!{.ipypthon/}*' -g '!{.icons/}*' -g '!{.themes/}*' -g '!{.mozilla/}*' -g '!{.paradoxlauncher/}*' -g '!{.ssh/}*' -g '!{.conan}' -g '!{.git}' -g '!{dosdevices}' -g '!{compatdata}' -g '!{BraveSoftware}' -g '!{discord}' -g '!{BetterDiscord}' 2> /dev/null'
export FZF_CTRL_T_OPTS="
    --preview-window nohidden
    --height 80%
    --prompt=' FILES '
    --preview 'bat --line-range :500 {}'"
# }}}
# Alt-C {{{
export FZF_ALT_C_OPTS="
    --prompt='נּ CHDIR '
    --height 80%
    --preview 'tree -C {} | head -200'
    --preview-window nohidden"
# }}}
# ** Completion {{{
export FZF_COMPLETION_OPTS="
    --info=default
    --height 80%
    --prompt=' FUZZY '
    --preview-window hidden"
# }}}
# Tab completion {{{
# zstyle ':fzf-tab:*' fzf-command sk
# zstyle :fzf-tab:* fzf-flags "$SKIM_DEFAULT_OPTIONS"
# Switch group {{{
zstyle ':fzf-tab:*' switch-group 'alt-h' 'alt-l'
# }}}
# Disable sort when completing `git checkout` {{{
zstyle ':completion:*:git-checkout:*' sort false
# }}}
# Set descriptions format to enable group support {{{
zstyle ':completion:*:descriptions' format '[%d]'
# }}}
# Set list-colors to enable filename colorizing {{{
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# }}}
# Preview directory's content with exa when completing cd {{{
zstyle ':fzf-tab:complete:cd:*' fzf-flags --prompt=" CD " --preview-window=nohidden
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# }}}
# Kill and ps preview {{{
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:ps:argument-rest' fzf-preview \
    '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:ps:argument-rest' fzf-flags --prompt="ﰌ PS " --height=80% --preview-window=nohidden:down:3:wrap
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview \
    '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags --prompt=" KILL " --height=80% --preview-window=nohidden:down:3:wrap
# }}}
# Show systemd units {{{
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-flags --prompt=' SYSTEMD ' --preview-window=down:4:nohidden:wrap
# }}}
# Env vars {{{
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
    fzf-preview 'echo ${(P)word}'
# }}}
# Git {{{
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
    'git diff $word | bat -p --color=always'
zstyle ':fzf-tab:complete:git-*:*' fzf-flags --prompt=' GIT ' --preview-window=nohidden
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
    'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
    'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
    'case "$group" in
    "commit tag") git show --color=always $word ;;
    *) git show --color=always $word ;;
esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    'case "$group" in
    "modified file") git diff $word ;;
    "recent commit object name") git show --color=always $word ;;
    *) git log --color=always $word ;;
esac'
# }}}
# Man {{{
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
# }}}
# General options {{{
zstyle ':fzf-tab:*' fzf-flags '--color=fg:8,bg:#f5f5f5,hl:1,fg+:7,bg+:#f5f5f5,hl+:9,gutter:#f5f5f5' \
    '--color=border:8,info:5,prompt:2,spinner:3,pointer:6,marker:4' \
    '--prompt= FZF ' \
    '--preview-window=nohidden' \
    '--multi' \
    '--height=90%'
zstyle ':fzf-tab:*' default-color $'\033[37m'
# }}}
# Accept line enter {{{
zstyle ':fzf-tab:*' fzf-bindings 'enter:accept'
zstyle ':fzf-tab:*' accept-line enter
# }}}
# }}}
