install:
	cp zshrc ${HOME}/.zshrc
	cp zshenv ${HOME}/.zshenv
	if [ ! -d ${HOME}/.zsh.d ]; then mkdir ${HOME}/.zsh.d; fi
	( cd zsh.d; tar cf - . ) | ( cd ${HOME}/.zsh.d; tar xf - )

	cp gitconfig ${HOME}/.gitconfig
