#!/bin/sh

keybindings_url="https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash"

CURRENT_OS=$(uname -s | awk '{print tolower($0)}')

cd $HOME
ln -fs configs/bashrc_$CURRENT_OS .bashrc
ln -fs configs/bash_profile_$CURRENT_OS .bash_profile

fzfdir="$HOME/apps/fzf-scripts"
[ -d "$fzfdir" ] || mkdir -p "$fzfdir"

# Debian based?
if [ $(which dpkg) ]; then
	keybindings_file="$(dpkg -L fzf |fgrep key-bindings.bash)"
	cp "$keybindings_file" "$fzfdir/key-bindings.bash"
else
	curl -L -o "$fzfdir/key-bindings.sh" "$keybindings_url"
fi
