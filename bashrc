##
# Settings
##
HISTCONTROL=ignoreboth
HISTFILE=~/.bash_history
HISTSIZE=1000

# Language specific locations
GOPATH=$HOME/apps/go
#JAVA_HOME=/usr/local/jdk-1.8.0/
#PYTHONPATH=/usr/local/lib/python3.7/site-packages

# Use most if available, else less
if [ -x /usr/local/bin/most ]; then
	export PAGER=most
else
	# Use colors for less, man, etc.
	# To compile mostlike.txt, do this
	# $ tic mostlike.txt
	# It will end up under ~/.terminfo/m/mostlike
	# Source: http://nion.modprobe.de/blog/archives/569-colored-manpages.html
	alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"
fi

alias ls="/bin/ls -F --color=auto"

if [ -x /usr/local/bin/vim ]; then
	export EDITOR=vim
	export VISUAL=emacs
	alias rvim"=vim --servername vim --remote-tab"
fi

if [ -r /home/weezel/apps/fzf-scripts/key-bindings.bash ]; then
	. /home/weezel/apps/fzf-scripts/key-bindings.bash
fi

