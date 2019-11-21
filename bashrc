##
# Settings
##
HISTCONTROL=ignoreboth
HISTFILE=~/.bash_history
HISTSIZE=10000

# Language specific locations
GOPATH=$HOME/apps/go
JAVA_HOME=/usr/local/jdk-1.8.0/
PYTHONPATH=/usr/local/lib/python3.7/site-packages

export PS1 GOPATH JAVA_HOME PYTHONPATH SDL_VIDEO_X11_DGAMOUSE

[ -r $HOME/configs/shell/bash_aliases ] \
	&& . $HOME/configs/shell/bash_aliases

[ -r $HOME/configs/shell/bash_functions ] \
	&& . $HOME/configs/shell/bash_functions

[ -r $HOME/apps/fzf-scripts/key-bindings.bash ] \
	&& . $HOME/apps/fzf-scripts/key-bindings.bash

# Use colors for less, man, etc.
# To compile mostlike.txt, do this
# $ tic mostlike.txt
# It will end up under ~/.terminfo/m/mostlike
# Source: http://nion.modprobe.de/blog/archives/569-colored-manpages.html
alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"

# fileutils
if [ -x $(which gls) ]; then
        alias ls="/usr/local/bin/gls -F --color=auto"
fi
# colourful grep
if [ -x $(which ggrep) ]; then
        alias grep="ggrep --colour=auto"
fi
# vim for the win
if [ -x $(which vim) ]; then
        export EDITOR=vim
        export VISUAL=emacs
        alias rvim"=vim --servername vim --remote-tab"
fi

