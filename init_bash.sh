#!/bin/sh

keybindings_url="https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash"

cd $HOME
ln -fs configs/bashrc .bashrc
ln -fs configs/bash_profile .bash_profile

fzfdir="$HOME/apps/fzf-scripts"
[ -d "$fzfdir" ] || mkdir -p "$fzfdir"

# Debian based?
if [ $(which dpkg) ]; then
	keybindings_file="$(dpkg -L fzf |fgrep key-bindings.bash)"
	cp "$keybindings_file" "$fzfdir/key-bindings.bash"
else
	curl -L -o "$fzfdir/key-bindings.sh" "$keybindings_url"
fi
