#!/bin/sh

[[ -r $HOME/.ksh_autocomplete ]] || \
	ln -s ${HOME}/configs/shell/ksh_autocomplete $HOME/.ksh_autocomplete
[[ -r ${HOME}/.kshrc ]] || \
	ln -s ${HOME}/configs/kshrc ${HOME}/.kshrc
[[ -r ${HOME}/.profile ]] || \
	ln -s ${HOME}/configs/profile ${HOME}/.profile
