#!/bin/sh

function python3langserv
{
	local readonly _pylspath="$HOME/apps/py3-langserver"

	[[ -d "${_pylspath}" ]] || mkdir -p "${_pylspath}"
	python3 -m venv "${_pylspath}"
	cd "${_pylspath}"
	. bin/activate
	echo "Installing python-language-server in venv..."
	bin/pip3 install python-language-server
	echo "Upgrading pip"
	bin/pip3 install --upgrade pip
	deactivate
	echo "Done"
}

curl --create-dirs -fLo autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

case "${1}" in
pyls)
	python3langserv
	;;
esac
