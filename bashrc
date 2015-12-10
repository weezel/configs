# Aliases
alias ls="ls -F"
alias pfrules="/usr/bin/sudo /sbin/pfctl -vvs rules | grep @"
alias rm="rm -i"
alias cp="cp -i"
alias rgvim="gvim --servername gvim --remote-tab"
alias fswebcam="`which fswebcam` -c $HOME/.fswebcam.conf"

# GNU ls alias color ls
if [ -x /usr/local/bin/gls ]; then
    alias ls="/usr/local/bin/gls -F --color=auto"
fi

# Better pager
export PAGER=less
export LESSCHARSET=utf-8
#if [ -x /usr/local/bin/most ]; then
#    alias less="/usr/local/bin/most"
#    export PAGER=/usr/local/bin/most
#fi

# Colourful grep
if [ -x /usr/local/bin/ggrep ]; then
    alias grep="ggrep --colour=auto"
fi
# Fileutils
if [ -x /usr/local/bin/gls ]; then
    alias ls="/usr/local/bin/gls -F --color=auto"
fi
# Vim for the win
if [ -x /usr/local/bin/vim ]; then
    export EDITOR=/usr/local/bin/vim
    export VISUAL=/usr/local/bin/vim
fi
# cdrecord
alias cdrecord='cdrecord -v'

# Not a right place for export(s), but..
export SDL_VIDEO_X11_DGAMOUSE=0

