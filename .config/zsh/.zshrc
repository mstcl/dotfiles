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
function sudo-command-line() {
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
function fancy-ctrl-z() {
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
function paf() {
	yay -Sl | sed -r 's/\x1B\[(;?[0-9]{1,3})+[mGK]//g' |
		awk '{ print $2 " " $4 $5 }' |
		sed 's/installed/i/' |
		fzf --border=top \
			--border-label="Select package(s) to install" \
			--delimiter " " \
			--preview-window=nohidden \
			--preview 'yay -Si {1}' |
		awk '{ print $1 }' |
		xargs -ro yay -Sy \
		 --sudoloop --removemake --cleanafter
} # [p]acman [i]nstall with [f]zf
function prf() {
	yay -Qq | fzf -q "$1" --border=top \
		--border-label="Select package(s) to uninstall" \
		--preview-window=nohidden --preview 'yay -Qi {1}' |
		xargs -ro yay -Rns
} # [p]acman remove with [f]zf
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
function gsc() {
	local commit=${1:-HEAD}
	nvim -c "CodeDiff $commit"
} # [g]it [s]how [c]ommit

# :: alias quit
alias q="exit" # [q]uit

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
alias tree='eza --color=always --group-directories-first -T'
alias treea='eza --color=always --group-directories-first --git --git-ignore -Ta'
alias treed='eza --color=always --group-directories-first -TD'

alias l='eza --color=always --group-directories-first --git-ignore'
alias ls='eza --color=always --group-directories-first --git-ignore'
alias la='eza --color=always --group-directories-first --git -ha'
alias ll='eza --color=always --group-directories-first --git -lhgo'
alias lla='eza --color=always --group-directories-first --git -lhgoa'
alias lal='eza --color=always --group-directories-first --git -lhgoa'

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
alias gmv='git mv'  # [g]it [m]o[v]e
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
alias gta='git ta'  # [g]it [ta]gs
alias gun='git un'  # [g]it [un]do
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
alias pacsys='yay -Ps'                         # [pac]man [sys]tem stats
alias pacnews='yay -Pw'                        # [pac]man [news]
alias pacup='yay -Syu --removemake --sudoloop' # [pac]man [up]date
alias pacad='yay -Sy'                          # [pac]man [ad]d
alias pacrm='yay -Rns'                         # [pac]man [r]e[m]ove
alias pacown='yay -Ql'                         # [pac]man which package [own]s these files
alias pacclean='yay -Scd'                      # [pac]man [c]lean and [d]elete cache
function pacstat() {
  if [[ $* == *-a* ]]; then
  	shift
  	yay -Qi $@
  else
  	yay -Si $@
  fi
} # [pac]man [stat] a package
function pacgrep() {
  if [[ $* == *-a* ]]; then
  	shift
  	yay -Ss $@
  else
  	yay -Qs $@
  fi
} # [pac]man [grep]
function pacwho() {
  if [[ $* == *-a* ]]; then
  	shift
  	yay -Fy $@
  else
  	yay -Qo $@
  fi
} # [pac]man [who] owns the file
function pacls() {
  if [[ $* == *-a* ]]; then
  	shift
  	yay -Q
  else
  	yay -Qe
  fi
} # [pac]man [l]ist installed packages
function pacorphans() {
  if [[ $* == *-a* ]]; then
  	shift
  	yay -Qtd
  else
  	yay -Qte
  fi
} # [pac]man ls [o]rphans
alias paclogi="grep -i installed /var/log/pacman.log | cut -d ' ' -f1,4" # [pac]man [log] [i]nstalled
alias paclogr="grep -i removed /var/log/pacman.log | cut -d ' ' -f1,4"   # [pac]man [log] [r]emoved
alias paclogu="grep -i upgraded /var/log/pacman.log | cut -d ' ' -f1,4"  # [pac]man [log] [u]pdated

# :: tea (gitea CLI)
alias gtc='tea pulls c'    # [g]i[t]ea pull [c]reate
alias gtm='tea pulls m $1' # [g]i[t]ea pull [m]erge

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
alias js="just"

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
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
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
zsh-defer source $XDG_DATA_HOME/zsh/plugins/fzf-tab/fzf-tab.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/fzf-tab-source/*.plugin.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source $XDG_DATA_HOME/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# :: other stuff
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
export GPG_TTY=$(tty)

# :: tidy up
unset FD_FLAGS
unset ERD_PREVIEW
unset TERRAFORM_ARGS TERRAFORM_BIN

# :: foot-specific issue: https://codeberg.org/dnkl/foot/issues/797
function precmd {
    print -Pn "\e[ q"
}

# :: setup completion for custom funcs
compdef _git gsc=git-show
