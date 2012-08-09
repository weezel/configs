# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

##
# Settings
##
HISTFILE=~/.sh_history
HISTSIZE=1000

# use most if available, else less
if [ -x /usr/local/bin/most ]; then
	export PAGER=most
else
	export PAGER=less
	#export LESS_TERMCAP_mb=$'\e[01;31m'
	#export LESS_TERMCAP_md=$'\e[01;31m'
	#export LESS_TERMCAP_me=$'\e[0m'
	#export LESS_TERMCAP_se=$'\e[0m'
	#export LESS_TERMCAP_so=$'\e[01;44;33m'
	#export LESS_TERMCAP_ue=$'\e[0m'
	#export LESS_TERMCAP_us=$'\e[01;32m'
fi
# fileutils
if [ -x /usr/local/bin/gls ]; then
	alias ls="/usr/local/bin/gls -F --color=auto"
fi
# colourful grep
if [ -x /usr/local/bin/ggrep ]; then
	alias grep="ggrep --colour=auto"
fi
# vim for the win
if [ -x /usr/local/bin/vim ]; then
	export EDITOR=vim
	export VISUAL=emacs
	alias rvim"=vim --servername vim --remote-tab"
fi

#set -o vi
#set +o emacs

