# Remove suspend console binding
stty stop ''

[ -r $HOME/.bashrc ] \
	&& . $HOME/.bashrc

SSH_AGENT_PID=$(pgrep -u $(id -u) ssh-agent)
if [[ -z $SSH_AGENT_PID ]]; then
	eval $(ssh-agent -a $HOME/.ssh/agent_sock)
	for key in $HOME/.ssh/id_rsa $HOME/.ssh/id_ed25519; do
		if [ -r "${key}" ]; then
			ssh-add "${key}"
		fi
	done
fi

# Ulimit
#ulimit -d 716800

