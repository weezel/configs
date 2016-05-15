#!/bin/sh

ln -s $HOME/configs/dotvim/ $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
cp $HOME/configs/tmux.conf $HOME/.tmux.conf
cp $HOME/configs/gitconfig $HOME/.gitconfig
[[ -r $HOME/.ssh/config ]] || cp $HOME/configs/sshconfig $HOME/.ssh/config
