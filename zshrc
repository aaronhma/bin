export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# Set PATH, CDPATH, EDITOR, etc.
# PATH variable for use with MacPorts. /opt/local/bin
export PATH=$RUBY_PATH:$RUBY_GEM_PATH:$CPP_PACKAGE_PATH:$PYTHON3_PACKAGE_PATH:$CMAKE_PREFIX_PATH:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/sbin:/bin:/usr/bin:/opt/local/bin:/opt/local/sbin:$HOME/local/bin:/sbin/

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

#---------------------------------------------------------------------
# NODE.JS:  Export the node module to use as a locally include
export NODE_PATH=/usr/local/lib/node_modules/:$PATH


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

alias reload='source ~/.zshrc'

alias pip='python3 -m pip'
alias jupyter='python3 -m jupyter'

# brew
alias doctor='echo "Calling doctor..."; history -c; softwareupdate -l; brew update; brew upgrade; brew cleanup; brew doctor'

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

#alias glog="git log --pretty='format:%Cgreen%h%Creset %an - %s' --graph"
alias glog="git log --graph --pretty=format:'%C(red)%h%C(reset) %C(dim white)%an%C(reset): %C(cyan)%s - %C(reset) %C(yellow)%d%C(reset) %C(dim white)(%cr)%Creset' --abbrev-commit --date=relative"
alias glog2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold red)%h%C(reset) - %C(bold green)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# gl1 foo.txt  // a list of all commits containg foo.txt
alias gl1="git rev-list --all --pretty=format:'%C(red)%h%C(reset) %C(dim white)%an%C(reset): %C(cyan)%s - %C(reset) %C(yellow)%d%C(reset) %C(dim white)(%cr)%Creset' "

alias gla="glog --author " #get specific author's commits

# Zip the name of the folder in the same directory
function zip() {
	zip -r $1.zip $1
}

# Get gzipped file size
function gz() {
	echo "orig size (bytes): "
	cat "$1" | wc -c
	echo "gzipped size (bytes): "
	gzip -c "$1" | wc -c
}

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

# Gzip-enabled `curl`
function gurl() {
	curl -sH "Accept-Encoding: gzip" "$@" | gunzip
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

# All the dig info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer
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

# Find Image width
function width () {
	echo $(sips -g pixelWidth $1 | grep -oE "[[:digit:]]{1,}$")
}

# Find Image height
function height () {
	echo $(sips -g pixelHeight $1 | grep -oE "[[:digit:]]{1,}$")
}


#  ====================
#  = System Processes =
#  ====================
alias tu='top -o cpu' # cpu
alias tm='top -o vsize' # memory

# Empty the Trash on all mounted volumes and the main HDD. Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv ~/.Trash;"

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
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Show the path in the finder new window. One time edit
alias showPath="defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

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

# Get macOS Software Updates, update Homebrew itself, and upgrade installed Homebrew packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade'

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
