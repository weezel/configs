#!/bin/sh

set -euo pipefail


keybindings_url="https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash"

CURRENT_OS=$(uname -s | awk '{print tolower($0)}')

cd $HOME
ln -fs configs/bashrc_$CURRENT_OS .bashrc
ln -fs configs/bash_profile_$CURRENT_OS .bash_profile

fzfdir="$HOME/apps/fzf-scripts"
[ -d "$fzfdir" ] || mkdir -p "$fzfdir"

# Debian based?
if [ $(which dpkg 2>/dev/null) ]; then
	echo "-> dpkg"
	keybindings_file="$(dpkg -L fzf |grep key-bindings.bash)"
	cp -f "$keybindings_file" "$fzfdir/key-bindings.bash"
# Manjaro?
elif [ $(which pacman 2>/dev/null) ]; then
	echo "-> pacman"
	keybindings_file="$(pacman -Ql fzf |awk '/key-bindings.bash/ {print $NF}')"
	cp -f "$keybindings_file" "$fzfdir/key-bindings.bash"
else
	echo "-> other"
	curl -L -o "$fzfdir/key-bindings.sh" "$keybindings_url"
fi

