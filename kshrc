HISTCONTROL=ignoredups:ignorespace
HISTFILE=~/.sh_history
HISTSIZE=100000

[ -r $HOME/configs/shell/env_openbsd ] \
        && . $HOME/configs/shell/env_openbsd

[ -r $HOME/configs/shell/aliases_openbsd ] \
        && . $HOME/configs/shell/aliases_openbsd

[ -r $HOME/configs/shell/functions_openbsd ] \
        && . $HOME/configs/shell/functions_openbsd

[ -r $HOME/.ksh_autocomplete ] \
        && . $HOME/.ksh_autocomplete

# Stylize PS1
if [ -r $HOME/configs/machine_specific/ps1 ]; then
       . $HOME/configs/machine_specific/ps1
else
       [ -r $HOME/configs/shell/ps1 ] \
               && . $HOME/configs/shell/ps1
fi
export PS1

# "Show status" binding
stty status ^T

set +o markdirs         # Add / to all directory names generated from wildcard
                        # expansion. From zmyrgel's dotfile.
