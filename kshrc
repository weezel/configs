# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

HISTFILE=~/.sh_history
HISTSIZE=1000

##
# Settings
##
#set -o vi
#set +o emacs
#bind -m '^A'=

#PS1='\n$(tput setaf 6) \w\n$(tput setaf 5)\t $(tput setaf 7)\u@\H $(tput setaf 2)\$$(tput op) '
##
# Aliases
##
alias ls="ls -F"
alias pfrules="/usr/bin/sudo /sbin/pfctl -vvs rules | grep @"
alias rm="rm -i"
alias cp="cp -i"
alias rvim"=vim --servername vim --remote-tab"

# use most if available, else less
if [ -x /usr/local/bin/most ]; then
	export PAGER=most
else
	export PAGER=less
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
    export EDITOR=/usr/local/bin/vim
    export VISUAL=/usr/local/bin/vim
fi

