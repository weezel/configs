PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/local/libexec:/usr/libexec:/usr/local/jdk-1.7.0/bin/

if [ "$PS1" ]; then
    #PS1=''\['\A\u@\h\w'\]' '
    #PS1=''\[''$M'\A'$W'\u@\h'$C'\w'$RS''\]' '
    #PS1='\[\033[1;35m\][\A]\u@\h[\w]\[\033[0m\] '
    #PS1='\[\033[1;34m\][\A]\[\033[1;37m\]\u\033[1;34m\][\w]\[\033[0m\] '
    PS1='\n\033[1;35m──── \w ────\n\033[1;37m\A \u \033[1;32m>\033[0m '
fi

### Aliases
# GNU ls alias color ls
if [ -x /usr/local/bin/gls ]; then
    alias ls="/usr/local/bin/gls -F --color=auto"
fi

# Better pager
if [ -x /usr/local/bin/most ]; then
    alias less="/usr/local/bin/most"
    export PAGER=/usr/local/bin/most
fi

# Colourful grep -> more fancy
if [ -x /usr/local/bin/ggrep ]; then
    alias grep="ggrep --colour=always"
fi

# Vim for the win
if [ -x /usr/local/bin/vim ]; then
    export EDITOR=/usr/local/bin/vim
    export VISUAL=/usr/local/bin/vim
fi

alias cdrecord='cdrecord -v'

# Some other aliases for the base system included commands
alias pfrules="/usr/bin/sudo /sbin/pfctl -vvs rules | grep @"
alias rm="/bin/rm -i"
alias cp="/bin/cp -i"
alias rgvim"=gvim --servername gvim --remote-tab"
alias fswebcam="`whereis fswebcam` -c $HOME/.fswebcam.conf"
#umask 0117

# Notify mails
#biff y 

# Remove stupid suspend console binding
stty stop ''

# Exports
export TERM=screen-256color
export INPUTRC=/etc/inputrc
export CVSROOT=anoncvs@openbsd.informatik.uni-erlangen.de:/cvs
export PKG_PATH=http://ftp.eu.openbsd.org/pub/OpenBSD/snapshots/packages/amd64/
export JAVA_HOME=/usr/local/jdk-1.7.0/
export SDL_VIDEO_X11_DGAMOUSE=0
#export PYTHONPATH=/usr/local/lib/python2.5/site-packages
#export TERM=color_xterm
#export CVSROOT=/home/weezel/cvs
#export PATH PAGER EDITOR VISUAL INPUTRC CVSROOT PKG_PATH PYTHONPATH JAVA_HOME

#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;31m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;44;33m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;32m'
