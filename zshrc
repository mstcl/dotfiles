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

# PROFILING (ignore) {{{
zmodload zsh/zprof
#}}}

# BINDKEY {{{
# Emacs style keybindings because I want speed in cmdline
bindkey -e

# Edit line in vim with ctrl-e:
autoload edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line
bindkey '^b' backward-word
bindkey '^f' forward-word
# }}}

# GENERAL OPTIONS {{{
# Change directory with name
setopt autocd

# Allow comments in interactive mode
setopt interactivecomments

# Enable filename expansion for 'x=y'
setopt magicequalsubst

# Hide error message when there is no match
setopt nonomatch

# Sort filenames numerically
setopt numericglobsort

# Don't consider as parts of word
export WORDCHARS=${WORDCHARS//\/}

# Hide EOL character
PROMPT_EOL_MARK=""

# Change sudo prompt
export SUDO_PROMPT=" Password: "

# Man pages
export PAGER=nvimpager
# }}}

# ANTIGEN {{{
# Get plugins and themes
source /usr/share/zsh/share/antigen.zsh
antigen bundles <<EOBUNDLES
    mdumitru/fancy-ctrl-z
    hcgraf/zsh-sudo
    hlissner/zsh-autopair
EOBUNDLES
antigen theme spaceship-prompt/spaceship-prompt
antigen apply
# }}}

# SAUCE {{{
# Other sourcing
source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/scripts/other/fzf-tab-completion.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
# }}}

# ZOXIDE SETUP {{{
eval "$(zoxide init zsh)"
# }}}

# HISTORY {{{
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTSIZE=500000
export SAVEHIST=500000
export HIST_STAMPS="mm/dd/yyyy"
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt share_history
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt hist_ignore_dups
# }}}

# SPACESHIP PROMPT {{{
# Left prompt
export SPACESHIP_PROMPT_ORDER=(
    user
    dir
    host
    char
)

# Right prompt
export SPACESHIP_RPROMPT_ORDER=(
    git
    docker
    exec_time
    jobs
)

export SPACESHIP_CHAR_SYMBOL="%F{red}%F{green}%F{blue}%F{green}"
# export SPACESHIP_CHAR_SYMBOL="%F{red}$"
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_GIT_BRANCH_PREFIX=" "
export SPACESHIP_GIT_STATUS_AHEAD=""
export SPACESHIP_GIT_STATUS_BEHIND=""
export SPACESHIP_CHAR_SYMBOL_SECONDARY="%F{red} "
export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_GIT_BRANCH_COLOR="yellow"
export SPACESHIP_GIT_STATUS_COLOR="yellow"
export SPACESHIP_GIT_STATUS_ADDED="%F{yellow}+%F{yellow}"
export SPACESHIP_GIT_STATUS_UNTRACKED="%F{blue}?%F{yellow}"
export SPACESHIP_GIT_STATUS_DELETED="%F{red}%F{yellow}"
export SPACESHIP_GIT_STATUS_MODIFIED="%F{green}!%F{yellow}"
# }}}

# AUTOSUGGESTION {{{
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
    end-of-line
)
export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-word
    emacs-forward-word
)
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

# EXA COLORS {{{
export EXA_COLORS="da=1;31"
# LS_COLORS monstrosity {{{
export LS_COLORS="BLK=38;5;68:CAPABILITY=38;5;17:CHR=38;5;113;1:DIR=38;5;30:DOOR=38;5;127:EXEC=38;5;208;1:FIFO=38;5;126:FILE=0:LINK=target:MULTIHARDLINK=38;5;222;1:NORMAL=0:ORPHAN=48;5;196;38;5;232;1:OTHER_WRITABLE=38;5;220;1:SETGID=48;5;3;38;5;0:SETUID=38;5;220;1;3;100;1:SOCK=38;5;197:STICKY=38;5;86;48;5;234:STICKY_OTHER_WRITABLE=48;5;235;38;5;139;3:*README=38;5;220;1:*README.rst=38;5;220;1:*README.md=38;5;220;1:*LICENSE=38;5;220;1:*COPYING=38;5;220;1:*INSTALL=38;5;220;1:*COPYRIGHT=38;5;220;1:*AUTHORS=38;5;220;1:*HISTORY=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*PATENTS=38;5;220;1:*VERSION=38;5;220;1:*NOTICE=38;5;220;1:*CHANGES=38;5;220;1:*.log=38;5;190:*.txt=38;5;253:*.adoc=38;5;184:*.asciidoc=38;5;184:*.etx=38;5;184:*.info=38;5;184:*.markdown=38;5;184:*.md=38;5;184:*.mkd=38;5;184:*.nfo=38;5;184:*.pod=38;5;184:*.rst=38;5;184:*.tex=38;5;184:*.textile=38;5;184:*.bib=38;5;178:*.json=38;5;178:*.jsonl=38;5;178:*.jsonnet=38;5;178:*.libsonnet=38;5;142:*.ndjson=38;5;178:*.msg=38;5;178:*.pgn=38;5;178:*.rss=38;5;178:*.xml=38;5;178:*.fxml=38;5;178:*.toml=38;5;178:*.yaml=38;5;178:*.yml=38;5;178:*.RData=38;5;178:*.rdata=38;5;178:*.xsd=38;5;178:*.dtd=38;5;178:*.sgml=38;5;178:*.rng=38;5;178:*.rnc=38;5;178:*.cbr=38;5;141:*.cbz=38;5;141:*.chm=38;5;141:*.djvu=38;5;141:*.pdf=38;5;141:*.PDF=38;5;141:*.mobi=38;5;141:*.epub=38;5;141:*.docm=38;5;111;4:*.doc=38;5;111:*.docx=38;5;111:*.odb=38;5;111:*.odt=38;5;111:*.rtf=38;5;111:*.odp=38;5;166:*.pps=38;5;166:*.ppt=38;5;166:*.pptx=38;5;166:*.ppts=38;5;166:*.pptxm=38;5;166;4:*.pptsm=38;5;166;4:*.csv=38;5;78:*.tsv=38;5;78:*.ods=38;5;112:*.xla=38;5;76:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.pages=38;5;111:*.numbers=38;5;112:*.key=38;5;166:*config=1:*cfg=1:*conf=1:*rc=1:*authorized_keys=1:*known_hosts=1:*.ini=1:*.plist=1:*.profile=1:*.bash_profile=1:*.bash_login=1:*.bash_logout=1:*.zshenv=1:*.zprofile=1:*.zlogin=1:*.zlogout=1:*.viminfo=1:*.pcf=1:*.psf=1:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.last-run=1:*.merged-ca-bundle=1:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-project=1:*.sublime-workspace=1:*.tmTheme=1:*.user-ca-bundle=1:*.rstheme=1:*.epf=1:*.git=38;5;197:*.gitignore=38;5;240:*.gitattributes=38;5;240:*.gitmodules=38;5;240:*.awk=38;5;172:*.bash=38;5;172:*.bat=38;5;172:*.BAT=38;5;172:*.sed=38;5;172:*.sh=38;5;172:*.zsh=38;5;172:*.vim=38;5;172:*.kak=38;5;172:*.ahk=38;5;41:*.py=38;5;41:*.ipynb=38;5;41:*.rb=38;5;41:*.gemspec=38;5;41:*.pl=38;5;208:*.PL=38;5;160:*.t=38;5;114:*.msql=38;5;222:*.mysql=38;5;222:*.pgsql=38;5;222:*.sql=38;5;222:*.tcl=38;5;64;1:*.r=38;5;49:*.R=38;5;49:*.gs=38;5;81:*.clj=38;5;41:*.cljs=38;5;41:*.cljc=38;5;41:*.cljw=38;5;41:*.scala=38;5;41:*.sc=38;5;41:*.dart=38;5;51:*.asm=38;5;81:*.cl=38;5;81:*.lisp=38;5;81:*.rkt=38;5;81:*.lua=38;5;81:*.moon=38;5;81:*.c=38;5;81:*.C=38;5;81:*.h=38;5;110:*.H=38;5;110:*.tcc=38;5;110:*.c++=38;5;81:*.h++=38;5;110:*.hpp=38;5;110:*.hxx=38;5;110:*.ii=38;5;110:*.M=38;5;110:*.m=38;5;110:*.cc=38;5;81:*.cs=38;5;81:*.cp=38;5;81:*.cpp=38;5;81:*.cxx=38;5;81:*.cr=38;5;81:*.go=38;5;81:*.f=38;5;81:*.F=38;5;81:*.for=38;5;81:*.ftn=38;5;81:*.f90=38;5;81:*.F90=38;5;81:*.f95=38;5;81:*.F95=38;5;81:*.f03=38;5;81:*.F03=38;5;81:*.f08=38;5;81:*.F08=38;5;81:*.nim=38;5;81:*.nimble=38;5;81:*.s=38;5;110:*.S=38;5;110:*.rs=38;5;81:*.scpt=38;5;219:*.swift=38;5;219:*.sx=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.hi=38;5;110:*.hs=38;5;81:*.lhs=38;5;81:*.agda=38;5;81:*.lagda=38;5;81:*.lagda.tex=38;5;81:*.lagda.rst=38;5;81:*.lagda.md=38;5;81:*.agdai=38;5;110:*.zig=38;5;81:*.v=38;5;81:*.pyc=38;5;240:*.tf=38;5;168:*.tfstate=38;5;168:*.tfvars=38;5;168:*.css=38;5;125;1:*.less=38;5;125;1:*.sass=38;5;125;1:*.scss=38;5;125;1:*.htm=38;5;125;1:*.html=38;5;125;1:*.jhtm=38;5;125;1:*.mht=38;5;125;1:*.eml=38;5;125;1:*.mustache=38;5;125;1:*.coffee=38;5;074;1:*.java=38;5;074;1:*.js=38;5;074;1:*.mjs=38;5;074;1:*.jsm=38;5;074;1:*.jsp=38;5;074;1:*.php=38;5;81:*.ctp=38;5;81:*.twig=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*Dockerfile=38;5;155:*.dockerignore=38;5;240:*Makefile=38;5;155:*MANIFEST=38;5;243:*pm_to_blib=38;5;240:*.nix=38;5;155:*.dhall=38;5;178:*.rake=38;5;155:*.am=38;5;242:*.in=38;5;242:*.hin=38;5;242:*.scan=38;5;242:*.m4=38;5;242:*.old=38;5;242:*.out=38;5;242:*.SKIP=38;5;244:*.diff=48;5;197;38;5;232:*.patch=48;5;197;38;5;232;1:*.bmp=38;5;97:*.dicom=38;5;97:*.tiff=38;5;97:*.tif=38;5;97:*.TIFF=38;5;97:*.cdr=38;5;97:*.flif=38;5;97:*.gif=38;5;97:*.icns=38;5;97:*.ico=38;5;97:*.jpeg=38;5;97:*.JPG=38;5;97:*.jpg=38;5;97:*.nth=38;5;97:*.png=38;5;97:*.psd=38;5;97:*.pxd=38;5;97:*.pxm=38;5;97:*.xpm=38;5;97:*.webp=38;5;97:*.ai=38;5;99:*.eps=38;5;99:*.epsf=38;5;99:*.drw=38;5;99:*.ps=38;5;99:*.svg=38;5;99:*.avi=38;5;114:*.divx=38;5;114:*.IFO=38;5;114:*.m2v=38;5;114:*.m4v=38;5;114:*.mkv=38;5;114:*.MOV=38;5;114:*.mov=38;5;114:*.mp4=38;5;114:*.mpeg=38;5;114:*.mpg=38;5;114:*.ogm=38;5;114:*.rmvb=38;5;114:*.sample=38;5;114:*.wmv=38;5;114:*.3g2=38;5;115:*.3gp=38;5;115:*.gp3=38;5;115:*.webm=38;5;115:*.gp4=38;5;115:*.asf=38;5;115:*.flv=38;5;115:*.ts=38;5;115:*.ogv=38;5;115:*.f4v=38;5;115:*.VOB=38;5;115;1:*.vob=38;5;115;1:*.ass=38;5;117:*.srt=38;5;117:*.ssa=38;5;117:*.sub=38;5;117:*.sup=38;5;117#bitmapimagetrack:*.vtt=38;5;117:*.3ga=38;5;137;1:*.S3M=38;5;137;1:*.aac=38;5;137;1:*.amr=38;5;137;1:*.au=38;5;137;1:*.caf=38;5;137;1:*.dat=38;5;137;1:*.dts=38;5;137;1:*.fcm=38;5;137;1:*.m4a=38;5;137;1:*.mod=38;5;137;1:*.mp3=38;5;137;1:*.mp4a=38;5;137;1:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.opus=38;5;137;1:*.s3m=38;5;137;1:*.sid=38;5;137;1:*.wma=38;5;137;1:*.ape=38;5;136;1:*.aiff=38;5;136;1:*.cda=38;5;136;1:*.flac=38;5;136;1:*.alac=38;5;136;1:*.mid=38;5;136;1:*.midi=38;5;136;1:*.pcm=38;5;136;1:*.wav=38;5;136;1:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.afm=38;5;66:*.fon=38;5;66:*.fnt=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.ttf=38;5;66:*.otf=38;5;66:*.woff=38;5;66:*.woff2=38;5;66:*.PFA=38;5;66:*.pfa=38;5;66:*.7z=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.WARC=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*.apk=38;5;215:*.ipa=38;5;215:*.deb=38;5;215:*.rpm=38;5;215:*.jad=38;5;215:*.jar=38;5;215:*.ear=38;5;215:*.war=38;5;215:*.cab=38;5;215:*.pak=38;5;215:*.pk3=38;5;215:*.vdf=38;5;215:*.vpk=38;5;215:*.bsp=38;5;215:*.dmg=38;5;215:*.crx=38;5;215#GoogleChromeextension:*.xpi=38;5;215#MozillaFirefoxextension:*.r[0-9]{0,2}=38;5;239:*.zx[0-9]{0,2}=38;5;239:*.z[0-9]{0,2}=38;5;239:*.part=38;5;239:*.iso=38;5;124:*.bin=38;5;124:*.nrg=38;5;124:*.qcow=38;5;124:*.sparseimage=38;5;124:*.toast=38;5;124:*.vcd=38;5;124:*.vmdk=38;5;124:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.db=38;5;60:*.fmp12=38;5;60:*.fp7=38;5;60:*.localstorage=38;5;60:*.mdb=38;5;60:*.mde=38;5;60:*.sqlite=38;5;60:*.typelib=38;5;60:*.nc=38;5;60:*.pacnew=38;5;33:*.un~=38;5;241:*.orig=38;5;241:*.BUP=38;5;241:*.bak=38;5;241:*.o=38;5;241#*nixObjectfile(sharedlibraries,coredumpsetc):*core=38;5;241#Linuxusercoredumpfile(from/proc/sys/kernel/core_pattern):*.mdump=38;5;241#MiniDuMPcrashreport:*.rlib=38;5;241#Staticrustlibrary:*.dll=38;5;241#dynamiclinkedlibrary:*.swp=38;5;244:*.swo=38;5;244:*.tmp=38;5;244:*.sassc=38;5;244:*.pid=38;5;248:*.state=38;5;248:*lockfile=38;5;248:*lock=38;5;248:*.err=38;5;160;1:*.error=38;5;160;1:*.stderr=38;5;160;1:*.aria2=38;5;241:*.dump=38;5;241:*.stackdump=38;5;241:*.zcompdump=38;5;241:*.zwc=38;5;241:*.pcap=38;5;29:*.cap=38;5;29:*.dmp=38;5;29:*.DS_Store=38;5;239:*.localized=38;5;239:*.CFUserTextEncoding=38;5;239:*.allow=38;5;112:*.deny=38;5;196:*.service=38;5;45:*@.service=38;5;45:*.socket=38;5;45:*.swap=38;5;45:*.device=38;5;45:*.mount=38;5;45:*.automount=38;5;45:*.target=38;5;45:*.path=38;5;45:*.timer=38;5;45:*.snapshot=38;5;45:*.application=38;5;116:*.cue=38;5;116:*.description=38;5;116:*.directory=38;5;116:*.m3u=38;5;116:*.m3u8=38;5;116:*.md5=38;5;116:*.properties=38;5;116:*.sfv=38;5;116:*.theme=38;5;116:*.torrent=38;5;116:*.urlview=38;5;116:*.webloc=38;5;116:*.lnk=38;5;39:*CodeResources=38;5;239#codesigningapps:*PkgInfo=38;5;239#appbundleid:*.nib=38;5;57#UI:*.car=38;5;57#assetcatalog:*.dylib=38;5;241#sharedlib:*.entitlements=1:*.pbxproj=1:*.strings=1:*.storyboard=38;5;196:*.xcconfig=1:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.xib=38;5;208:*.asc=38;5;192;3:*.bfe=38;5;192;3:*.enc=38;5;192;3:*.gpg=38;5;192;3:*.signature=38;5;192;3:*.sig=38;5;192;3:*.p12=38;5;192;3:*.pem=38;5;192;3:*.pgp=38;5;192;3:*.p7s=38;5;192;3:*id_dsa=38;5;192;3:*id_rsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*.32x=38;5;213:*.cdi=38;5;213:*.fm2=38;5;213:*.rom=38;5;213:*.sav=38;5;213:*.st=38;5;213:*.a00=38;5;213:*.a52=38;5;213:*.A64=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.adf=38;5;213:*.atr=38;5;213:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gel=38;5;213:*.gg=38;5;213:*.ggl=38;5;213:*.ipk=38;5;213#Nintendo(DSPackedImages):*.j64=38;5;213:*.nds=38;5;213:*.nes=38;5;213:*.sms=38;5;213:*.8xp=38;5;121:*.8eu=38;5;121:*.82p=38;5;121:*.83p=38;5;121:*.8xe=38;5;121:*.stl=38;5;216:*.dwg=38;5;216:*.ply=38;5;216:*.wrl=38;5;216:*.pot=38;5;7:*.pcb=38;5;7:*.mm=38;5;7:*.gbr=38;5;7:*.scm=38;5;7:*.xcf=38;5;7:*.spl=38;5;7:*.Rproj=38;5;11:*.sis=38;5;7:*.1p=38;5;7:*.3p=38;5;7:*.cnc=38;5;7:*.def=38;5;7:*.ex=38;5;7:*.example=38;5;7:*.feature=38;5;7:*.ger=38;5;7:*.ics=38;5;7#calendarinformation:*.map=38;5;7:*.mf=38;5;7:*.mfasl=38;5;7:*.mi=38;5;7:*.mtx=38;5;7:*.pc=38;5;7:*.pi=38;5;7:*.plt=38;5;7:*.pm=38;5;7:*.rdf=38;5;7:*.ru=38;5;7:*.sch=38;5;7:*.sty=38;5;7:*.sug=38;5;7:*.tdy=38;5;7:*.tfm=38;5;7:*.tfnt=38;5;7:*.tg=38;5;7:*.vcard=38;5;7:*.vcf=38;5;7#contactinformation:*.xln=38;5;7:*.iml=38;5;166:*.conf=32:*.ini=33:*.rasi=34"
# }}}
# }}}

# FZF VARIABLES {{{
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
    --layout=reverse
    --border=sharp
    --margin 5%,7%
    --info=default
    --multi --bind 'ctrl-a:select-all'
    --bind '?:toggle-preview'"
# Ctrl-R
export FZF_CTRL_R_OPTS="
    --height 50%
    --info=hidden
    --prompt=' '
    --preview-window hidden"
# Ctrl-T
export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow -g '!{.git}' -g '!{dosdevices}' -g '!{compatdata}' 2> /dev/null'
export FZF_CTRL_T_OPTS="
    --preview-window nohidden
    --height 80%
    --prompt=' '
    --preview 'bat --line-range :500 {}'"
# Alt-C
export FZF_ALT_C_OPTS="
    --prompt='נּ '
    --height 80%
    --preview 'tree -C {} | head -200'
    --preview-window nohidden"
# Completion.zsh
export FZF_COMPLETION_OPTS="
    --info=default
    --height 80%
    --preview-window hidden"

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
# Empty directory but keep directory (need /*)
alias edir='rm -rfvi'
alias etrash='rm -rfv $TRASH/*'

# Auto color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Create new directory
alias md="mkdir -p"

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

# Quick reload wpg
alias wpgr='wpg -s $(wpg -c)'

# Time zsh startup
alias ztime='time zsh -i -c exit'

# Nvim aliases
alias nv='nvim'
alias vim='nvim'
alias v='nvim'

# Stop fucking cluttering my home
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget/history"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# Conda
alias condact="conda activate"

# Exa commands
alias lt='exa --icons --color=always -h --git --git-ignore --group-directories-first -T'
alias lta='exa --icons --color=always -h --group-directories-first --git --git-ignore -T -a'
alias l='exa --icons --color=always --group-directories-first -h --git --git-ignore'
alias la='exa --icons --color=always --group-directories-first -h --git -a'
alias ll='exa -l --icons --color=always --group-directories-first -h --git'
alias lla='exa -l --icons --color=always --group-directories-first -h --git -a'

# Git commands
alias gs='git status'
alias gr='git remote -v'

# Holy grail command ???
alias fetch='neofetch --backend $1'

# Edit configs
alias zshconf='nvim ~/dotfiles/zshrc'
alias i3conf='nvim ~/dotfiles/i3-config.conf'
alias kittyconf='nvim ~/dotfiles/kitty.conf'
alias vimconf='nvim ~/dotfiles/nvim-init.vim'
alias polyconf='nvim ~/scripts/polybar/bar/modules.ini'

# Find files to edit
alias fv='nvim $(fzf --height 40% --preview-window=nohidden --height=50% --border=sharp --margin=5%,7% --layout=reverse --marker="++" --prompt=" " --preview="bat --line-range :500 {}")'

# Tile current wallpaper
alias tilewall='feh --bg-tile ~/.config/wpg/.current'

# Sudo commands
alias sunv='sudo -E nvim $1'
alias sue='sudo -E $1'

# I don't want to fuck my system up
alias mv='mv -iv'
alias rm='rm -iv'
alias rmf='rm -rfvi'
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

# kmon
alias kmon="sudo -E kmon -u"
# }}}

# FUNCTIONS {{{
# Mkdir and then cd into it
function mkcd
{
    command mkdir $1 && cd $1
}

# Change fzf-completion commands
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" . "$1"
}

# Paru fuzzy install
function ins {
    paru -Slq | fzf --height=80% --prompt=" " --preview-window=hidden --preview 'paru -Si {1}' | xargs -ro paru -S --removemake --cleanafter
}

# Paru fuzzy remove
function rem() {
    paru -Qq | fzf -q "$1" --height=80% --prompt=" " --preview-window=hidden --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}

# Tldr fuzzy
function cheat() {
    if [[ "$#" -ne 0 ]]; then
        tldr $@
        return
        #fzf_args="-q $*"
    fi
    tldr --list | fzf -q "$1"--prompt=' ' --preview-window=nohidden,80%  --preview "echo {} | xargs tldr --color always" | xargs -r tldr
}

# Custom jump to dir for vm()
function jd() {
    fd --type d --hidden --follow --exclude ".git" --exclude "pfx" --exclude "dosdevices" --exclude "steamapps" --exclude "drive_c" | sed 's@^\./@@' | fzf --prompt="נּ " --height=40% --preview-window=hidden
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

#PROFILING (ignore) {{{
# zprof
# }}}
