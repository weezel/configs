#!/bin/sh

vim_init() {
	local _vim_undodir="$HOME/.config/vim/undodir"

	[[ -d "$_vim_undodir" ]] || mkdir -p "$_vim_undodir"
	ln -fs "$HOME/configs/dotvim/" "$HOME/.vim"
	ln -fs "$HOME/.vim/vimrc" "$HOME/.vimrc"

	ln -fs "$HOME/configs/dotvim/" "$HOME/.config/nvim"
}

tig_init() {
	local _tig_configdir="$HOME/.config/tig"
	[[ -d "$_tig_configdir" ]] || mkdir -p "$_tig_configdir"
	ln -fs $HOME/configs/tigrc "$_tig_configdir/"
}

git_init() {
	ln -fs "$HOME/configs/gitconfig" "$HOME/.gitconfig"
	ln -fs "$HOME/configs/tigrc" "$HOME/.tigrc"
}

case $1 in
vim)
	vim_init
	;;
git)
	tig_init
	git_init
	;;

*)
	vim_init
	tig_init
	git_init

	[[ -r $HOME/.tmux.conf ]] \
			|| cp $HOME/configs/tmux.conf $HOME/.tmux.conf

	[[ -r $HOME/.ssh/config ]] \
			|| cp $HOME/configs/sshconfig $HOME/.ssh/config

	tic $HOME/configs/mostlike.txt
	;;
esac

