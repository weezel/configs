TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
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

[ -r $HOME/configs/shell/aliases ] && . $HOME/configs/shell/aliases
[ -r $HOME/configs/shell/functions ] && . $HOME/configs/shell/functions

# Need to import here since it uses functions
if [ -r $HOME/configs/machine_specific/ps1 ]; then
	. $HOME/configs/machine_specific/ps1
else
	[ -r $HOME/configs/shell/ps1 ] \
	&& . $HOME/configs/shell/ps1
fi
export PS1

# Remove suspend console binding
stty stop ''

# Load ksh specific configuration if exist
if [ ${SHELL} == "/bin/ksh" ] && [ -f ~/.kshrc ]; then
	. ~/.kshrc
elif [ ${SHELL} == "/bin/bash" ] && [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

