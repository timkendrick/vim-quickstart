#!/bin/bash
set -e
cd ~

if [ ! -d vim-quickstart ]; then
	git clone https://github.com/timkendrick/vim-quickstart.git
	echo "source $(pwd)/vim-quickstart/quickstart.vim" >> ~/.vimrc
else
	cd vim-quickstart
	git pull
	cd ..
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim -c PluginInstall -c qa

brew install caskroom/cask/brew-cask editorconfig the_silver_searcher macvim
brew tap caskroom/fonts
brew cask install font-dejavu-sans-mono-for-powerline

~/.vim/bundle/YouCompleteMe/install.py
