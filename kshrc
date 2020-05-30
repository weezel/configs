# sh/ksh initialization

##
# Settings
##
HISTCONTROL=ignoredups:ignorespace
HISTFILE=~/.sh_history
HISTSIZE=10000

# Language specific settings
JAVA_HOME=/usr/local/jdk-11
PYTHONPATH=/usr/local/lib/python3.8/site-packages
GO111MODULE=on

SDL_VIDEO_X11_DGAMOUSE=0

export PS1 JAVA_HOME PYTHONPATH SDL_VIDEO_X11_DGAMOUSE

[ -r $HOME/configs/shell/openbsd_aliases ] \
	&& . $HOME/configs/shell/openbsd_aliases

[ -r $HOME/configs/shell/openbsd_functions ] \
	&& . $HOME/configs/shell/openbsd_functions

[ -r $HOME/.ksh_autocomplete ] \
	&& . $HOME/.ksh_autocomplete

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

# "Show status" binding
stty status ^T

set +o markdirs		# Add / to all directory names generated from wildcard
			# expansion. From zmyrgel's dotfile.

