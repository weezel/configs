# sh/ksh initialization

#ENV=$HOME/.kshrc
#export ENV
#
TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/libexec:/usr/libexec:/usr/local/jdk-1.8.0/bin/:/usr/games
LESSCHARSET=utf-8
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

SSH_AGENT_PID=$(pgrep -u $(id -u) ssh-agent)
if [ -z $SSH_AGENT_PID ]; then
	eval $(ssh-agent -a $HOME/.ssh/agent_sock)
	ssh-add $HOME/.ssh/id_rsa
fi

export HOME PATH TERM LESSCHARSET LC_ALL LANG

#[ -r $HOME/.shell/variables ] && . $HOME/.shell/variables
[ -r $HOME/configs/shell/aliases ] && . $HOME/configs/shell/aliases
[ -r $HOME/configs/shell/functions ] && . $HOME/configs/shell/functions

# Need to import here since it uses functions
PS1='[\e[1;32m\]\t\[\e[0m\]] $(prev_exitval `whoami`)@\[\H \e[1;33m\]\W\e[0m\] $(git_branch) $ '
export PS1

# Notify mails
#biff y

# Remove suspend console binding
stty stop ''

# Ulimit
#ulimit -d 716800

# Load ksh specific configuration if exist
if [ ${SHELL} == "/bin/ksh" ] && [ -f ~/.kshrc ]; then
	. ~/.kshrc
fi

