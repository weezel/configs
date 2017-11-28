#!/bin/sh

mkdir -p "$HOME/.config/vim/undodir"

ln -s $HOME/configs/dotvim/ $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/configs/gitconfig $HOME/.gitconfig
cp $HOME/configs/tmux.conf $HOME/.tmux.conf
[[ -r $HOME/.ssh/config ]] || cp $HOME/configs/sshconfig $HOME/.ssh/config
tic $HOME/configs/mostlike.txt
