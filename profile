# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

# Check TERM capabilities
if [[ $TERM = xterm ]]; then
	export TERM="xterm-256color";
else
	export TERM="wsvt25";
fi

#PS1="\[$(tput setaf 5)\]\u\[$(tput op)\]@\h:\w\$ "
PS1='\n$(tput setaf 6) \w\n$(tput setaf 5)\t $(tput setaf 7)\u@\H >$(tput op) '
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
CVSROOT=anoncvs@anoncvs.eu.openbsd.org:/cvs
PKG_PATH=http://ftp.eu.openbsd.org/pub/OpenBSD/snapshots/packages/amd64/
JAVA_HOME=/usr/local/jdk-1.7.0/
PYTHONPATH=/usr/local/lib/python2.6/site-packages
HISTFILE=~/.sh_history

export PS1 PATH HOME TERM PAGER VISUAL EDITOR PKG_PATH JAVA_HOME PYTHONPATH\
	HISTFILE
export SDL_VIDEO_X11_DGAMOUSE=0


##
# Aliases
##
#alias ls="ls -F"
alias pfrules="/usr/bin/sudo /sbin/pfctl -vvs rules | grep @"
alias rm="rm -i"
alias cp="cp -i"
alias rgvim"=gvim --servername gvim --remote-tab"

if [ -x /usr/local/bin/gls ]; then
    alias ls="/usr/local/bin/gls -F --color=auto"
fi

# Colourful grep -> more fancy
if [ -x /usr/local/bin/ggrep ]; then
    alias grep="ggrep --colour=always"
fi

# Vim for the win
if [ -x /usr/local/bin/vim ]; then
    export EDITOR=/usr/local/bin/vim
    export VISUAL=/usr/local/bin/vim
fi

# Remove stupid suspend console binding
stty stop ''

#set -o vi
set +o emacs
bind -m '^A'=
