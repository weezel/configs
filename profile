# sh/ksh initialization

#if [[ $TERM == xterm ]]; then
#	export TERM="xterm-256color";
#else
#	export TERM="screen";
#fi


PS1='\n$(tput setaf 6) \w\n$(tput setaf 5)\t $(tput setaf 7)\u@\H $(tput setaf 2)\$$(tput op) '
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/libexec:/usr/libexec:/usr/local/jdk-1.7.0/bin/
INPUTRC=/etc/inputrc
CVSROOT=anoncvs@anoncvs.eu.openbsd.org:/cvs
#PKG_PATH=http://ftp.eu.openbsd.org/pub/OpenBSD/5.0/packages/i386/
PKG_PATH=http://ftp.eu.openbsd.org/pub/OpenBSD/snapshots/packages/`uname -p`/
JAVA_HOME=/usr/local/jdk-1.7.0/
PYTHONPATH=/usr/local/lib/python2.7/site-packages
#TERM=screen
#LESSCHARSET=utf-8
LC_ALL=C
#LC_CTYPE="en_US.UTF-8"
HISTFILE=~/.sh_history
HISTSIZE=1000
#export SDL_VIDEO_X11_DGAMOUSE=0

sprunge() {
	printf '%s%s\n' "$(curl -sF 'sprunge=<-' http://sprunge.us/)" "${*:+?$*}";
}

export PS1 HOME PATH INPUTRC CVSROOT PKG_PATH JAVA_HOME PYTHONPATH \
	TERM LESSCHARSET LC_ALL HISTFILE HISTSIZE

# Common aliases
alias sudo="sudo -E"

#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;31m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;44;33m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;32m'

# Ulimit
ulimit -d 716800

# Notify mails
#biff y

# Remove stupid suspend console binding
stty stop ''

#set -o vi
#set +o emacs
#bind -m '^A'=

