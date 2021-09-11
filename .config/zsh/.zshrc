# :.config/zsh/.zshrc
# vim:set fdm=marker foldenable ft=zsh foldlevel=0:

# INSTANT PROMPT {{{
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}
# ZOXIDE {{{
eval "$(zoxide init zsh)"
# }}}
# GENERAL OPTIONS {{{
bindkey -e
setopt glob_dots
setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt numericglobsort
# }}}
# SHELL TITLE {{{
ZSH_TAB_TITLE_ONLY_FOLDER=true
ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
ZSH_TAB_TITLE_ENABLE_FULL_COMMAND=false
# }}}
# ANTIGEN {{{
source /usr/share/zsh/share/antigen.zsh
antigen bundles <<EOBUNDLES
    trystan2k/zsh-tab-title
    romkatv/zsh-defer
EOBUNDLES
antigen apply
# }}}
# SAUCE {{{
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/.p10k.zsh
zsh-defer source /usr/share/doc/pkgfile/command-not-found.zsh
zsh-defer source "$HOME"/.config/zsh/.functions
zsh-defer source "$HOME"/.config/zsh/.aliases
zsh-defer source "$HOME"/.config/zsh/.fzf
zsh-defer source "$HOME"/.config/zsh/.completion.zsh
zsh-defer source /etc/grc.zsh
zsh-defer source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
zsh-defer source /usr/share/fzf/key-bindings.zsh
zsh-defer source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
zsh-defer source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}
# HISTORY {{{
HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=500000
SAVEHIST=500000
HIST_STAMPS="mm/dd/yyyy"
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt share_history
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt hist_ignore_dups
# }}}
# AUTOSUGGESTION {{{
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
    end-of-line
)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-word
    emacs-forward-word
)
# }}}
