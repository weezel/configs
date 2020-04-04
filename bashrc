##
# Settings
##
HISTCONTROL=ignoreboth
HISTFILE=~/.bash_history
HISTSIZE=10000

# Language specific settings
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
PYTHONPATH=/usr/local/lib/python3.7/site-packages
GO111MODULE=on


export PS1 JAVA_HOME PYTHONPATH SDL_VIDEO_X11_DGAMOUSE

[ -r $HOME/configs/shell/linux_aliases ] \
	&& . $HOME/configs/shell/linux_aliases

[ -r $HOME/configs/shell/linux_functions ] \
	&& . $HOME/configs/shell/linux_functions

[ -r $HOME/apps/fzf-scripts/key-bindings.bash ] \
	&& . $HOME/apps/fzf-scripts/key-bindings.bash

# Use colors for less, man, etc.
# To compile mostlike.txt, do this
# $ tic mostlike.txt
# It will end up under ~/.terminfo/m/mostlike
# Source: http://nion.modprobe.de/blog/archives/569-colored-manpages.html
alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"

# fileutils
if [[ -x $(which gls) ]]; then
        alias ls="/usr/local/bin/gls -F --color=auto"
else
	alias ls="ls -F --color=auto "
fi

# colourful grep
if [[ -x $(which ggrep) ]]; then
        alias grep="ggrep --colour=auto"
else
	alias grep="grep --color=auto"
fi

# vim for the win
if [[ -x $(which vim) ]]; then
        export EDITOR=vim
        export VISUAL=emacs
        alias rvim"=vim --servername vim --remote-tab"
fi

