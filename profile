# sh/ksh initialization

#ENV=$HOME/.kshrc
#export ENV
#
TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

PS1="[\e[1;32m\]\t\[\e[0m\]] \u@\[\H \e[1;33m\]\W\e[0m\] $ "
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/libexec:/usr/libexec:/usr/local/jdk-1.8.0/bin/:/usr/games/
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



SSH_AGENT_PID=$(pgrep -u $(id -u) ssh-agent)
if [ -z $SSH_AGENT_PID ]; then
	eval $(ssh-agent -a $HOME/.ssh/agent_sock)
	ssh-add $HOME/.ssh/id_rsa
fi

export PS1 HOME PATH INPUTRC CVSROOT PKG_PATH JAVA_HOME PYTHONPATH \
	TERM LESSCHARSET LC_ALL LANG HISTFILE HISTSIZE

#[ -r $HOME/.shell/variables ] && . $HOME/.shell/variables
[ -r $HOME/configs/shell/aliases ] && . $HOME/configs/shell/aliases
[ -r $HOME/configs/shell/functions ] && . $HOME/configs/shell/functions

# Notify mails
#biff y

# Remove suspend console binding
stty stop ''
# "Show status" binding
stty status ^T

# Ulimit
#ulimit -d 716800

##
# Some shell indepentent aliases
##
alias pfrules="/usr/bin/sudo /sbin/pfctl -vvs rules | grep @"
alias egrep="gegrep --color=auto"
alias sftp="sftp -c arcfour"
#alias sftp="sftp -o Ciphers=chacha20-poly1305@openssh.com"

# Load ksh specific configuration if exist
if [ ${SHELL} == "/bin/ksh" ] && [ -f ~/.kshrc ]; then
	. ~/.kshrc
fi

