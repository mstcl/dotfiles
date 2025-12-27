# :: shell options
setopt autocd # cd without typing cd
setopt interactive_comments # allow comments in commands
setopt magicequalsubst # unquoted arguments of form `anything=expression` have filename expansion
setopt glob_dots # dotfiles will be matched without specifying the dot i.e. *config will match .config
setopt numericglobsort # sort filenames numerically when applicable
setopt nonomatch # does not return error if file not found when globbing

# :: history configuration
HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=500000
SAVEHIST=500000
HIST_STAMPS="mm/dd/yyyy"
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS

# :: env vars
FD_FLAGS='--strip-cwd-prefix --follow 2> /dev/null' # fzf fd flags
ERD_PREVIEW='erd --color force --hidden -L 1 --no-progress --suppress-size --no-git \
            --no-ignore -x -f -y inverted {2} | head -200' # fzf erd flags
source "$ZDOTDIR"/lscolors.zsh # ls colros
source "$ZDOTDIR"/fzf_defaults.sh # fzf / defaults
export SUDO_PROMPT="Enter sudo password: " # sudo prompt
export LESSOPEN="|/usr/bin/lesspipe.sh %s" # lesspipe & lessfilter
export FZF_DEFAULT_COMMAND="fd ${FD_FLAGS}" # fzf default command
export FZF_CTRL_R_OPTS="
    --info=hidden
    --preview 'echo {}'
    --preview-window hidden
    --bind 'enter:accept'" # fzf / ctrl-r
export FZF_CTRL_T_COMMAND="fd --color=always ${FD_FLAGS}"
export FZF_CTRL_T_OPTS="
	--preview-window nohidden
    --ansi
    --select-1
    --exit-0" # fzf / ctrl-t
export _ZO_FZF_OPTS="${FZF_DEFAULT_OPTS}
    --no-sort
    --bind 'ctrl-d:'
    --bind 'ctrl-f:'
    --preview '${ERD_PREVIEW}'
    --preview-window nohidden:30%:border-sharp" # zoxide fzf options

# :: use zsh-defer to lazy-load other plugins
source $XDG_DATA_HOME/zsh/plugins/zsh-defer/zsh-defer.plugin.zsh

# :: keybindings / behaviour
bindkey -e # emacs keybinding in viins
autoload -Uz select-word-style
select-word-style bash # use bash select-word-style so Ctrl-W deletes # a directory at a time, not the whole directory
bindkey -r ^D # remove zsh native autocompletion popup
bindkey ^F forward-word # swap forward word and forward char for ergonomics
bindkey '^[f' forward-char
bindkey ^B backward-word # swap backward word and backward char for ergonomics
bindkey '^[b' backward-char

# :: ctrl-x to toggle sudo in normal mode
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
bindkey "^X" sudo-command-line

# :: ctrl-z to put process in background and ctrl-z again to bring it back up
fancy-ctrl-z() {
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

# :: run previous command again
run-again() {
	zle up-history
	zle accept-line
}
zle -N run-again
bindkey "^K" run-again

# :: edit command line
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# :: functions
function mkcd() { command mkdir $1 && cd $1 } # [mk]dir and [cd] into it
function temp() { cd "$(mktemp -d)" } # create [temp]orary directory
function scr() { "$EDITOR" $(mktemp) } # [scr]atch file
function yif() {
	yay -Sl | sed -r 's/\x1B\[(;?[0-9]{1,3})+[mGK]//g' |
		awk '{ print $2 " " $4 $5 }' |
		sed 's/installed/i/' |
		fzf --border=top \
			--border-label="Select package(s) to install" \
			--delimiter " " \
			--preview-window=nohidden \
			--preview 'yay -Si {1}' |
		awk '{ print $1 }' |
		xargs -ro yay -S \
		 --sudoloop --removemake --cleanafter
} # [y]ay [i]nstall with [f]zf
function yrf() {
	yay -Qq | fzf -q "$1" --border=top \
		--border-label="Select package(s) to uninstall" \
		--preview-window=nohidden --preview 'yay -Qi {1}' |
		xargs -ro yay -Rns
} # [y]ay remove with [f]zf
function rgf() {
	rg --line-number --no-heading --smart-case --color=never \
		--no-ignore-vcs --ignore-file ~/.config/fd/ignore "${*:-}" |
		fzf --preview-window=nohidden:up \
			--delimiter : \
			--preview-window 'up,60%,+{2}+3/3,~3' \
			--preview "bat --style=numbers,header --color=always {1} --highlight-line {2} \
    2> /dev/null" \
			--bind 'enter:become($EDITOR {1} +{2})'
} # [r]ip[g]rep with [f]zf and open in $EDITOR
function fv() {
	"$EDITOR" $(__fzf_select)
} # [f]zf select file and open in editor ([v]im)
function venf() {
  venv=$(/usr/bin/ls $VENV_DIR/ | fzf --border=top)
  if [[ $? == 130 ]]; then return; fi
  source "$VENV_DIR/$venv/bin/activate"
} # switch python [ven]v with [f]zf
function nbr() {
	type=$1; summary=$(echo $2 | tr " " "-"); ticket=$3;
	git fetch --prune --quiet
	git checkout master --quiet
	git merge origin/master --quiet
	if [[ -n "$ticket" ]] then; type="/$type"; fi
	git checkout -b "$ticket$type/$summary"
} # [n]ew [br]anch

# :: alias quit
alias q='exit' # [q]uit

# :: alias / sudo
alias sudo="sudo "
alias sunv='sudo -E "$EDITOR" $1'
alias sue='sudo -E $1'

# :: alias / force color outputs
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias diff='diff --color=always'
alias ip='ip --color=always'
alias fdisk="sudo grc fdisk -l"

# :: alias / overrides
alias mkp="mkdir -p" # [mk]dir -[p]
alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iv'
alias ln='ln -iv'
alias rmv='gtrash put --home-fallback' # [r]e[m]o[v]e
alias rst='gtrash restore'             # [r]e[st]ore
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings '
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget/history"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# :: alias / modern tool replacement
alias du='erd --no-git --hidden -H -i'
alias duf='duf -theme ansi'
alias cat='bat'
alias catp='bat -pp --color=always'
alias nv='nvim'
alias vi='nvim'
alias vim='nvim'
alias tree='eza --color=always -h --group-directories-first -T'                      # [l]ist [tree]
alias lta='eza --color=always -h --group-directories-first --git --git-ignore -T -a' # list tree all
alias l='eza --color=always --group-directories-first -h --git --git-ignore'         # [l]ist
alias ls='eza --color=always --group-directories-first -h --git --git-ignore'        # [l]ist
alias la='eza --color=always --group-directories-first -h --git -a'                  # [l]ist all
alias ll='eza -l --color=always --group-directories-first -h --git'                  # [l]ist [l]ong
alias lla='eza -l --color=always --group-directories-first -h --git -a'              # [l]ist [l]ong [a]ll

# :: alias / git (requires git aliases) -- convenience to avoid needing the space
alias g='git'       # [g]it
alias gad='git ad'  # [g]it [ad]d
alias gbr='git br'  # [g]it [br]anch
alias gcl='git cl'  # [g]it [cl]one
alias gcm='git cm'  # [g]it [c]o[m]mit
alias gco='git co'  # [g]it [c]heck[o]ut
alias gcp='git cp'  # [g]it [c]herry [p]ick
alias gdd='git dd'  # [g]it [d]iff side-by-side
alias gdi='git di'  # [g]it [di]ff
alias gfe='git fe'  # [g]it [fe]tch
alias gin='git in'  # [g]it [in]it
alias glo='git lo'  # [g]it [lo]g
alias gls='git ls'  # [g]it [l]og [s]hort
alias gpl='git pl'  # [g]it [p]u[l]l
alias gpu='git pu'  # [g]it [pu]sh
alias gra='git ra'  # [g]it [r]emote [a]dd
alias grb='git rb'  # [g]it [r]e[b]ase
alias gre='git re'  # [g]it [re]mote
alias gri='git ri'  # [g]it [r]ebase [i]nteractive
alias gsa='git sa'  # [g]it [s]tatus [a]ll
alias gsh='git sh'  # [g]it [sh]ow
alias gsl='git sl'  # [g]it [s]hort[log]
alias gsp='git sp'  # [g]it [s]tash [p]op
alias gss='git ss'  # [g]it [s]tatus [s]hort
alias gst='git st'  # [g]it [st]ash
alias gsu='git su'  # [g]it [s]ubmodule [u]pdate
alias gs='git sync' # [g]it [s]ync

# :: terraform
export TERRAFORM_ARGS="-parallelism=1"
export TERRAFORM_BIN='terraform'
alias tap="TF_CLI_ARGS=$TERRAFORM_ARGS $TERRAFORM_BIN apply" # [t]erraform [ap]ply
alias tpl="$TERRAFORM_BIN plan"                              # [t]erraform [pl]an
alias tim="$TERRAFORM_BIN import"                            # [t]erraform [im]port
alias tin="$TERRAFORM_BIN init"                              # [t]erraform [in]it
alias tcs="$TERRAFORM_BIN console"                           # [t]erraform [c]on[s]ole
alias tva="$TERRAFORM_BIN validate"                          # [t]erraform [va]lidate
alias tsl="$TERRAFORM_BIN show"                              # [t]erraform [sh]ow
alias tsp="$TERRAFORM_BIN state pull > terraform.tfstate"    # [t]erraform [s]tate [p]ull
alias tss="$TERRAFORM_BIN state show"                        # [t]erraform [s]tate [s]show
alias tsl="$TERRAFORM_BIN state list"                        # [t]erraform [s]tate [l]ist
alias tou="$TERRAFORM_BIN output"                            # [t]erraform [ou]put
alias tfm="$TERRAFORM_BIN format"                            # [t]erraform [f]or[m]at
alias tds="$TERRAFORM_BIN destroy"                           # [t]erraform [d]e[s]troy
alias tre="$TERRAFORM_BIN refresh"                           # [t]erraform [re]fresh
alias tta="$TERRAFORM_BIN taint"                             # [t]erraform [ta]int
alias tut="$TERRAFORM_BIN untaint"                           # [t]erraform [u]n[t]aint

# :: aur/pacman
alias pst='yay -Ps'                                                  # [p]acman [st]ats
alias pnw='yay -Pw'                                                  # [p]acman [n]e[w]s
alias pup='yay -Syu --removemake --sudoloop'                         # [p]acman [up]date
alias pid='yay -U'                                                   # [p]acman [i]nstall from [d]atabase
alias pir='yay -S'                                                   # [p]acman [i]nstall from [r]emote
alias pni='yay -Qi'                                                  # [p]acman i[n]fo of [i]nstalled
alias pna='yay -Si'                                                  # [p]acman i[n]fo of [a]ny
alias psi='yay -Qs'                                                  # [p]acman [s]each [i]nstalled
alias psa='yay -Ss'                                                  # [p]acman [s]earch [a]ny
alias pfi='yay -Qo'                                                  # [p]acman [f]ile owned by [i]nstalled
alias pfa='yay -F'                                                   # [p]acman [f]ile owned by [a]ny
alias plf='yay -Ql'                                                  # [p]acman [l]ist [f]iles owned
alias pla='yay -Q'                                                   # [p]acman [l]ist [a]ll installed
alias ple='yay -Qe'                                                  # [p]acman [l]ist [e]xplicit installed
alias poa='yay -Qdt'                                                 # [p]acman [o]rphaned [a]ll
alias poe='yay -Qet'                                                 # [p]acman [o]rphaned [e]xplicity
alias pcd='yay -Scd'                                                 # [p]acman [c]lean and [d]elete cache
alias pil="grep -i installed /var/log/pacman.log | cut -d ' ' -f1,4" # [p]acman [i]nstalled [l]og
alias prl="grep -i removed /var/log/pacman.log | cut -d ' ' -f1,4"   # [p]acman [r]emoved [l]og
alias pul="grep -i upgraded /var/log/pacman.log | cut -d ' ' -f1,4"  # [p]acman [u]pdated [l]og

# :: tea (gitea CLI)
alias gfc='tea pulls c'    # [g]it [f]orge pull [c]reate
alias gfm='tea pulls m $1' # [g]it [f]orge pull [m]erge

# :: jujutsu
alias j='jj'
alias jin='jj git init'                  # [j]j [in]it
alias jsa='jj st'                        # [j]j [s]t[a]tus
alias jnw='jj new'                       # [j]j [n]e[w]
alias jbc='jj bookmark c -r @-'          # [j]j [b]ookmark create
alias jpu='jj git push --allow-new'      # [j]j [b]ookmark create
alias jfe='jj git fetch --remote origin' # [j]j [fe]tch
alias jrb='jj rebase -d master@origin'   # [j]j [r]e[b]ase
alias jbt='jj bookmark t master@origin'  # [j]j [b]ookmark [t]rack

# :: other aliases
alias zt='time zsh -i -c exit'
alias ts='tailscale status'
alias w='curl -s https://wttr.in/London?format=3'
alias zke='zk edit -i'
alias th='~/.local/bin/toggle_dark'

# :: instant prompt
# NOTE: https://github.com/romkatv/powerlevel10k/issues/702#issuecomment-626222730
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"

# load autocompletion
function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}
fpath=($XDG_DATA_HOME/zsh/completions $fpath) # add completions directory to fpath
autoload -Uz compinit && compinit -i
[[ "$ZDOTDIR"/.zcompdump.zwc -nt "$ZDOTDIR"/.zcompdump ]] || zcompile-many "$ZDOTDIR"/.zcompdump
unfunction zcompile-many

# :: load prompt
source $XDG_DATA_HOME/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $XDG_CONFIG_HOME/zsh/p10k.zsh

# :: plugins configuration
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(end-of-line) # accept with EOL (Ctrl-E)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
	forward-word
	emacs-forward-word
	vi-forward-word
	vi-forward-word-end
	vi-forward-blank-word
	vi-forward-blank-word-end
	vi-find-next-char
	vi-find-next-char-skip
) # partial accept with forward word

# :: fzf-tab zstyle
zstyle ':fzf-tab:*' use-fzf-default-opts yes # use default fzf opts
zstyle ':fzf-tab:*' switch-group 'ctrl-h' 'ctrl-l' # switch tab group
zstyle ':completion:*:git-checkout:*' sort false # disable sort when completing git checkout
zstyle ':completion:*:descriptions' format '[%d]' # set descriptions format to enable group support
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # lscolors
zstyle ':completion:*' menu no

# :: fzf completion
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# :: load plugins
zsh-defer source /etc/grc.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-autopair/autopair.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-window-title/zsh-window-title.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/fzf-tab-source/*.plugin.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/fzf-tab/fzf-tab.zsh

# :: other stuff
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
export GPG_TTY=$(tty)

# :: uv default venv
[[ -d "$VENV_DIR/default/bin" ]] && zsh-defer source $VENV_DIR/default/bin/activate

# :: tidy up
unset FD_FLAGS
unset ERD_PREVIEW
unset TERRAFORM_ARGS TERRAFORM_BIN
