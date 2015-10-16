#!/bin/bash
set -e
cd ~

echo "[vim-quickstart] Downloading latest version of vim-quickstart..."
if [ ! -d vim-quickstart ]; then
	git clone https://github.com/timkendrick/vim-quickstart.git
	echo "source $(pwd)/vim-quickstart/quickstart.vim" >> ~/.vimrc
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
vim -c PluginInstall -c qa

echo "[vim-quickstart] Installing additional binaries..."
brew install caskroom/cask/brew-cask editorconfig the_silver_searcher
brew tap caskroom/fonts
brew cask install font-dejavu-sans-mono-for-powerline

~/.vim/bundle/YouCompleteMe/install.py

echo ""
echo "[vim-quickstart] Installed successfully!"
