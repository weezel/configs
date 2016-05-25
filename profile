# sh/ksh initialization

#ENV=$HOME/.kshrc
#export ENV
#
#[ -r $HOME/.shell/variables ] && . $HOME/.shell/variables
#[ -r $HOME/.shell/aliases ] && . $HOME/.shell/aliases
#[ -r $HOME/.shell/functions ] && . $HOME/.shell/functions

TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

PS1="[\e[1;32m\]\t\[\e[0m\]] \u@\[\H \e[1;33m\]\W\e[0m\] $ "
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/libexec:/usr/libexec:/usr/local/jdk-1.7.0/bin/:/usr/games/
INPUTRC=/etc/inputrc
CVSROOT=anoncvs@anoncvs.eu.openbsd.org:/cvs
JAVA_HOME=/usr/local/jdk-1.8.0/
PYTHONPATH=/usr/local/lib/python2.7/site-packages
#TERM=screen # if unicode is problem, use this <-- weird hint
#LC_ALL=C
LESSCHARSET=utf-8
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
export SDL_VIDEO_X11_DGAMOUSE=0

ripdvd() {
	lsdvd
	read nr
	for i in $(jot ${nr} 2); do mplayer -dumpstream -dumpfile \
		Nikke_Knatterton-${i}.vob dvd://$i ; done
}

. $HOME/configs/shell/functions

export PS1 HOME PATH INPUTRC CVSROOT PKG_PATH JAVA_HOME PYTHONPATH \
	TERM LESSCHARSET LC_ALL LANG HISTFILE HISTSIZE

# Notify mails
#biff y

# Remove suspend console binding
stty stop ''

# Ulimit
#ulimit -d 716800

##
# Some shell indepentent aliases
##
alias ls="ls -F"
alias pfrules="/usr/bin/sudo /sbin/pfctl -vvs rules | grep @"
alias rm="rm -i"
alias cp="cp -i"
alias egrep="gegrep --color=auto"
alias sftp="sftp -c arcfour"
#alias sftp="sftp -o Ciphers=chacha20-poly1305@openssh.com"

# Load ksh specific configuration if exist
if [ ${SHELL} == "/bin/ksh" ] && [ -f ~/.kshrc ]; then
	. ~/.kshrc
fi

