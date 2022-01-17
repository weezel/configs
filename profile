# Remove suspend console binding
stty stop ''

if [[ -r "${HOME}/.bashrc" ]]; then
	. "${HOME}/.bashrc"
elif [[ -r "${HOME}/.kshrc" ]]; then
	. "${HOME}/.kshrc"
fi

if [ $(pgrep -u "$USER" ssh-agent | wc -l) -eq 0 ]; then
	ssh-agent -t 8h > "${HOME}/.ssh/agent.env"
fi
[[ -z $SSH_AUTH_SOCK ]] && \
	. "${HOME}/.ssh/agent.env" >/dev/null

# Ulimit
#ulimit -d 716800

