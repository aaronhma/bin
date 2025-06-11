# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/aaronma/.zsh/completions:"* ]]; then export FPATH="/Users/aaronma/.zsh/completions:$FPATH"; fi
# defaults write com.apple.Finder AppleShowAllFiles YES
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/aaronma/.oh-my-zsh"

# echo $RANDOM_THEME - see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias clear="paclear -c yellow"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# For a full list of active aliases, run `alias`.
alias nproc="sysctl -n hw.logicalcpu"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# brew completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------

#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------


export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

export PATH=/opt/homebrew/anaconda3/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/git/bin:/opt/homebrew/opt/ruby/bin:/usr/local/sbin:/usr/sbin:/bin:/usr/bin:/opt/local/bin:/opt/local/sbin:$HOME/local/bin:/sbin/:$HOME/.bun/bin:/usr/local/lib/node_modules/:/Users/aaronma/.cache/lm-studio/bin:/Users/aaronma/.local/bin

# set vim options
export VIMINIT='set ai aw'

# Window names are not displaying properly
export DISABLE_AUTO_TITLE=true

# Prevent overwriting files
# set +/-o :  turns shell features On/Off
set -o noclobber

# launchctl limit maxfiles 2048 7200

# ulimit -n 1000

# Turn off "you have new mail" notice
# unset MAILCHECK


# adding gulp auto completion into the env
# eval "$(gulp --completion=zsh)"

#---------------------------------------------------------------------
# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"
# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------

#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------

#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------
#---------------------------------------------------------------------

alias nvim="nvim -c 'luafile ~/.config/nvim/init.lua'"

alias reload='source ~/.zshrc'

alias pip='python3 -m pip'
alias jupyter='python3 -m jupyter'

# brew
alias doctor='history -c; softwareupdate -l; brew update; brew upgrade; brew cleanup; brew doctor'

alias p='cd -'  # goto last dir cd'ed from
# Open current directory in Tree View
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Show list of files or directories
alias l='ls -lhGt'  # -l long listing, most recent first  # -G color
alias la="ls -Gla" # List all files colorized in long format, including dot files
alias ld='ls -l | grep "^d"' # List only directories
alias l.='ls -d .[^.]*'  # List all files starting with .
alias lh="ls -lh"
alias ll='ls -lhasG'  # -l long listing, human readable, no group info
alias lt='ls -lt' # sort with recently modified first

# Go into the name of the directory and list its files
# cdll testFolder
function cdll() {  cd $1; ll  }

# Make a new directiory and go straight into the newly created dir
# dir testFolder
function dir() {  mkdir -p "$@" && cd "$@" }

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias ls="command ls -G"
else
	alias ls="command ls --color"
	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi

alias h='history | tail'
alias md='mkdir -p'
alias rm='rm -i' #always do interactive rm's

#alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

# @{n} reflog reference, value of the HEAD of your repository
# HEAD^   :previous commit, which means "the parent of HEAD"
# d921970^2 means "the second parent of d921970."
# HEAD~ and HEAD^ are equivalent. The other main ancestry specification is the ~. also the first parent .The difference becomes apparent when you specify a number. HEAD~2 means "the first parent of the first parent," or "the grandparent" — it traverses the first parents the number of times you specify.
# HEAD^^^, which again is the first parent of the first parent of the first parent

# TODO: 1 git command to push everything with a prompt "what's your commit message?"

alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold red)%h%C(reset) - %C(bold green)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

alias gla="glog --author " #get specific author's commits

# Create a data URL from an image (works for other file types too, if you tweak the Content-Type afterwards)
function dataurl() {
	echo "data:image/${1##*.};base64,$(openssl base64 -in "$1")" | tr -d '\n'
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}"
	open "http://localhost:${port}/"
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
	encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# Syntax-highlight JSON strings or files
function json() {
	if [ -p /dev/stdin ]; then
		# piping, e.g. `echo '{"foo":42}' | json`
		python -mjson.tool | pygmentize -l javascript
	else
		# e.g. `json '{"foo":42}'`
		python -mjson.tool <<< "$*" | pygmentize -l javascript
	fi
}

# Escape UTF-8 characters into their 3-byte format
function escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
	echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
	perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
	echo # newline
}

# Get a character’s Unicode code point
function codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
	echo # newline
}

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Trim new lines and copy to clipboard
alias tc="tr -d '\n' | pbcopy"

# File size
alias fs="stat -c \"%s bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
# defaults write com.apple.finder AppleShowAllFiles true

# Show hidden apps as greyed out on macOS
# defaults write com.apple.Dock showhidden -bool TRUE && killall Dock

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"


# From http://github.com/suztomo/dotfiles
function rmf(){
	for file in $*
	do
		__rm_single_file $file
	done
}

function __rm_single_file(){
	if ! [ -d ~/.Trash/ ]
	then
		command /bin/mkdir ~/.Trash
	fi

	if ! [ $# -eq 1 ]
	then
		echo "__rm_single_file: 1 argument required but $# passed."
		exit
	fi

	if [ -e $1 ]
	then
		BASENAME=`basename $1`
		NAME=$BASENAME
		COUNT=0
		while [ -e ~/.Trash/$NAME ]
		do
			COUNT=$(($COUNT+1))
			NAME="$BASENAME.$COUNT"
		done

		command /bin/mv $1 ~/.Trash/$NAME
	else
		echo "No such file or directory: $file"
	fi
}


#  ==========
#  = SERVER =
#  ==========
function whoson () {
	date
	echo "Users logged in to $computer:"
	who
}

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# gpg
export GPG_TTY=$(tty)

# Disables the annoying volume up + screenshot hot key on Keychron K3 mechanical keyboard
# defaults write com.apple.symbolichotkeys 32 -dict-add 65 -int 0

# bun completions
[ -s "/Users/aaronma/.bun/_bun" ] && source "/Users/aaronma/.bun/_bun"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
. "/Users/aaronma/.deno/env"

# fixes g++/gcc "ld: symbol(s) not found for architecture arm64 collect2: error: ld returned 1 exit status"
alias gcc=/opt/homebrew/Cellar/gcc/15.1.0/bin/g++-15
alias g++=/opt/homebrew/Cellar/gcc/15.1.0/bin/g++-15
# alias clang=/opt/homebrew/Cellar/gcc/15.1.0/bin/g++-15
# alias clang++=/opt/homebrew/Cellar/gcc/15.1.0/bin/g++-15
