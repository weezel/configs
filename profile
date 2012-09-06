# sh/ksh initialization

if [[ $TERM == xterm ]]; then
	export TERM="xterm-256color";
else
	[ -n "$TMUX" ] && export TERM=screen-256color
fi
#[ -n "$TMUX" ] && export TERM=screen-256color


PS1="[\e[1;32m\]\t\[\e[0m\]] \u@\[\H \e[1;33m\]\W\e[0m\] $ "
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/libexec:/usr/libexec:/usr/local/jdk-1.7.0/bin/
INPUTRC=/etc/inputrc
CVSROOT=anoncvs@anoncvs.eu.openbsd.org:/cvs
PKG_PATH=http://ftp.eu.openbsd.org/pub/OpenBSD/snapshots/packages/`uname -p`/
JAVA_HOME=/usr/local/jdk-1.7.0/
PYTHONPATH=/usr/local/lib/python2.7/site-packages
#TERM=screen #jos ongelmia unicoden kanssa, kayta tata
#LC_ALL=C
LESSCHARSET=utf-8
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
export SDL_VIDEO_X11_DGAMOUSE=0

sprunge() {
	printf '%s%s\n' "$(curl -sF 'sprunge=<-' http://sprunge.us/)" "${*:+?$*}";
}

export PS1 HOME PATH INPUTRC CVSROOT PKG_PATH JAVA_HOME PYTHONPATH \
	TERM LESSCHARSET LC_ALL LANG HISTFILE HISTSIZE

# Notify mails
#biff y

# Remove stupid suspend console binding
stty stop ''

# Ulimit
ulimit -d 716800

##
# Some shell indepentent aliases
##
alias sudo="sudo -E"
alias ls="ls -F"
alias pfrules="/usr/bin/sudo /sbin/pfctl -vvs rules | grep @"
alias rm="rm -i"
alias cp="cp -i"
alias sftp="sftp -o Ciphers=arcfour128 -o MACs=umac-64@openssh.com"

# Load ksh specific configuration if exist
if [ ${SHELL} == "/bin/ksh" ] && [ -f ~/.kshrc ]; then
	. ~/.kshrc
fi

