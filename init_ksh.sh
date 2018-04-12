#!/bin/sh

cd $HOME
[[ -r .ksh_autocomplete ]] || \
        ln -s configs/shell/ksh_autocomplete .ksh_autocomplete
[[ -r .kshrc ]] || \
        ln -s configs/kshrc .kshrc
[[ -r .profile ]] || \
        ln -s configs/profile .profile
