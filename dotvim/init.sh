#!/bin/sh


function ideinit {
	local _vim_ide_file="$HOME/.config/vim_ide.vim"
	[[ -L "${_vim_ide_file}" ]] || \
		ln -s "$HOME/configs/dotvim/vim_ide.vim" "${_vim_ide_file}"

	local _nvim_ide_file="$HOME/.config/nvim_ide.vim"
	[[ -L "${_nvim_ide_file}" ]] || \
		ln -s "$HOME/configs/dotvim/nvim_ide.vim" "${_nvim_ide_file}"
}

function golangserv {
	echo "### Installing go-language-server..."
	go get -u github.com/sourcegraph/go-langserver
	echo "### Done"
}

function python3_langserv {
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

function vim_plug {
	echo "### Fetching Plug..."
	curl --create-dirs -fLo autoload/plug.vim \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "### Done"
}

case "${1}" in
gols)
	golangserv
	;;
ide_init)
	echo "### Use Vim as IDE"
	vim_plug
	ideinit
	;;
pyls)
	python3_langserv
	;;
*)
	printf "ide_init %17sUse Vim as IDE\n" ""
	printf "\nLanguage servers:\n"
	printf "gols %20sInstall go language server\n" ""
	printf "pyls %20sInstall Python language server\n" ""
	echo "\nusage: $0: [OPTION]"
	exit 0
esac

