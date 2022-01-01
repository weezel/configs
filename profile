# Remove suspend console binding
stty stop ''

[ -r $HOME/.bashrc ] \
	&& . $HOME/.bashrc

if [ $(pgrep -u "$USER" ssh-agent | wc -l) -eq 0 ]; then
	ssh-agent -t 8h > "${HOME}/.ssh/agent.env"
fi
if [[ ! $SSH_AUTH_SOCK ]]; then
	. "${HOME}/.ssh/agent.env" >/dev/null
fi

# Ulimit
#ulimit -d 716800

