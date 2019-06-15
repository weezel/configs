#!/bin/sh


function golangserv
{
	echo "### Installing go-language-server..."
	go get -u github.com/sourcegraph/go-langserver
	echo "### Done"
}

function python3_langserv
{
	local readonly _pylspath="$HOME/apps/language_servers/py3-langserver"

	echo "### Installing python-language-server in venv..."
	[[ -d "${_pylspath}" ]] || mkdir -p "${_pylspath}"
	python3 -m venv "${_pylspath}"
	cd "${_pylspath}"
	. bin/activate
	bin/pip3 install python-language-server
	echo "### Upgrading pip"
	bin/pip3 install --upgrade pip
	deactivate
	echo "### Done"
}

function vim_plug
{
	echo "### Fetching Plug..."
	curl --create-dirs -fLo autoload/plug.vim \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "### Done"
}

case "${1}" in
gols)
	golangserv
	;;
plug)
	vim_plug
	;;
pyls)
	python3_langserv
	;;
*)
	echo "usage: $0: [gols|plug|pyls]"
	exit 0
esac

