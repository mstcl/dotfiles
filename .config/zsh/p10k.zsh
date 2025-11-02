'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'
() {
  emulate -L zsh -o extended_glob
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    background_jobs
    context
    dir
    vcs
    newline
    command_execution_time
    prompt_char
  )
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    direnv
    virtualenv
    newline
    terraform_version
  )

  # :: base
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true
  typeset -g POWERLEVEL9K_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # :: separators and multiline prefix/suffix
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_{PREFIX,SUFFIX}=
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_SHOW_RULER=false
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=' '
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=' '
  typeset -g POWERLEVEL9K_MULTILINE_{FIRST,LAST}_PROMPT_SUFFIX=' '

  # :: prompt char
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VICMD_FOREGROUND=1
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_FOREGROUND=7
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIVIS_FOREGROUND=2
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=1
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='%(!.#.\$)'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='%(!.#.\$)'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='%(!.#.\$)'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='%(!.#.\$)'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=

  local anchor_files=(
    .bzr
    .citc
    .git
    .hg
    .node-version
    .python-version
    .go-version
    .ruby-version
    .lua-version
    .java-version
    .perl-version
    .php-version
    .tool-version
    .shorten_folder_marker
    .svn
    .terraform
    CVS
    Cargo.toml
    composer.json
    go.mod
    package.json
    stack.yaml
  )
  # :: dir
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=7
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=
  typeset -g POWERLEVEL9K_DIR_PREFIX='%8F@ '
  typeset -g POWERLEVEL9K_DIR_SUFFIX=
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=7
  typeset -g POWERLEVEL9K_DIR_SHORTENED_BACKGROUND=0
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=7
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  typeset -g POWERLEVEL9K_DIR_PATH_SEPARATOR='%8F/'
  typeset -g POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=true
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=true
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3
  typeset -g POWERLEVEL9K_LOCK_ICON='\UF023'
  typeset -g POWERLEVEL9K_DIR_CLASSES=(
  '*'            DEFAULT  '')
  typeset -g POWERLEVEL9K_DIR_DEFAULT_VISUAL_IDENTIFIER_EXPANSION=
  typeset -g POWERLEVEL9K_DIR_CONTENT_EXPANSION='%B$P9K_CONTENT%b'

  # :: vcs
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)
  typeset -g POWERLEVEL9K_VCS_FOREGROUND=15
  typeset -g POWERLEVEL9K_VCS_LOADING_TEXT=
  typeset -g POWERLEVEL9K_VCS_PREFIX='%8F󰘬 '
  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=
  typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0
  typeset -g POWERLEVEL9K_VCS_{INCOMING,OUTGOING}_CHANGESFORMAT_FOREGROUND=5
  typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind)
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED}_ICON=
  typeset -g POWERLEVEL9K_VCS_DIRTY_ICON='*'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=':⇣'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=':⇡'
  typeset -g POWERLEVEL9K_VCS_{COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=1
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${${${P9K_CONTENT/⇣* :⇡/⇣⇡}// }//:/ }'

  # :: execution time
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=7
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='%8F('
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_SUFFIX='%8F)'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=

  # :: background jobs
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=15
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='󰈆'

  # :: context
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=1
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=1
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=1
  typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION='●'
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%B%n'
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%B%n'
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%B%n'

  # :: virtualenv
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=6
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false

  # :: direnv
  typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=1
  typeset -g POWERLEVEL9K_DIRENV_VISUAL_IDENTIFIER_EXPANSION='●'

  # :: terraform
  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_SHOW_ON_COMMAND='terraform|terragrunt|tofu'
  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_FOREGROUND=5
  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_VISUAL_IDENTIFIER_EXPANSION=''

  # :: misc
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
  (( ! $+functions[p10k] )) || p10k reload
}
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}
(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
