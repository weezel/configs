# sh/ksh initialization

if [[ $TERM == xterm ]]; then
	export TERM="xterm-256color";
else
	export TERM="screen";
fi


PS1='\n$(tput setaf 6) \w\n$(tput setaf 5)\t $(tput setaf 7)\u@\H $(tput setaf 2)\$$(tput op) '
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/libexec:/usr/libexec:/usr/local/jdk-1.7.0/bin/
INPUTRC=/etc/inputrc
CVSROOT=anoncvs@anoncvs.eu.openbsd.org:/cvs
PKG_PATH=http://ftp.eu.openbsd.org/pub/OpenBSD/4.9/packages/i386/
JAVA_HOME=/usr/local/jdk-1.7.0/
PYTHONPATH=/usr/local/lib/python2.6/site-packages
#TERM=screen
LC_ALL=C
#LC_CTYPE="en_US.UTF-8"
#export SDL_VIDEO_X11_DGAMOUSE=0


export PS1 PATH HOME PKG_PATH JAVA_HOME PYTHONPATH TERM LC_ALL HISTFILE \
	HISTSIZE INPUTRC

#export LESSCHARSET=utf-8
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Ulimit
ulimit -d 716800

# Notify mails
#biff y

# Remove stupid suspend console binding
stty stop ''

# Ulimit
ulimit -d 716800

