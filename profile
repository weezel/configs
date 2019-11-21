# Common initialization

TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/libexec:/usr/libexec:/usr/local/jdk-1.8.0/bin/:/usr/games
LESSCHARSET=utf-8
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

SSH_AGENT_PID=$(pgrep -u $(id -u) ssh-agent)
if [[ -z $SSH_AGENT_PID ]]; then
	eval $(ssh-agent -a $HOME/.ssh/agent_sock)
	for key in $HOME/.ssh/id_rsa $HOME/.ssh/id_ed25519; do
		if [ -r "${key}" ]; then
			ssh-add "${key}"
		fi
	done
fi

export HOME PATH TERM LESSCHARSET LC_ALL LANG

# Notify mails
#biff y

# Remove suspend console binding
stty stop ''

# Ulimit
#ulimit -d 716800

# Need to import here since it uses functions
if [ -r $HOME/configs/machine_specific/ps1 ]; then
	. $HOME/configs/machine_specific/ps1
else
	[ -r $HOME/configs/shell/ps1 ] \
		&& . $HOME/configs/shell/ps1
fi

# Load shell specific configuration
if [ ${SHELL} == $(which bash 2>/dev/null) ] && [ -f ~/.bashrc ]; then
	. ~/.bashrc
elif [ ${SHELL} == $(which ksh 2>/dev/null) ] && [ -f ~/.kshrc ]; then
	. ~/.kshrc
fi

