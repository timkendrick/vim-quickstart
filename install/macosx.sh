#!/bin/bash
set -e

echo "[vim-quickstart] Downloading latest version of vim-quickstart..."
if [ ! -d vim-quickstart ]; then
	git clone https://github.com/timkendrick/vim-quickstart.git ~/.vim/bundle/vim-quickstart
	echo "source ~/.vim/bundle/vim-quickstart/.vimrc" >> ~/.vimrc
	echo "set runtimepath+=~/.vim/bundle/vim-quickstart" >> ~/.vimrc
	echo "quickstart#init()" >> ~/.vimrc
	echo "source ~/.vim/bundle/vim-quickstart/.gvimrc" >> ~/.gvimrc
else
	cd vim-quickstart
	git pull
	cd ..
fi

echo "[vim-quickstart] Installing Vundle..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "[vim-quickstart] Installing Vundle plugins..."
vim -c QuickstartInstall -c '!~/.vim/bundle/YouCompleteMe/install.py' -c qa

echo "[vim-quickstart] Installing additional binaries..."
brew install caskroom/cask/brew-cask editorconfig the_silver_searcher
brew tap caskroom/fonts
brew cask install font-dejavu-sans-mono-for-powerline

echo ""
echo "[vim-quickstart] Installed successfully!"
