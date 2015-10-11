" EDITOR SETTINGS

set nocompatible
set tabstop=4           " visual tab width
set number              " show line numbers
set relativenumber      " show relative line numbers
set showcmd             " show most recent command in bottom bar
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching braces
set incsearch           " incremental search
set hlsearch            " highlight current search term
set nrformats=          " set number format to decimal
set updatetime=250      " editor update debounce
set history=200         " number of commands to store in history
syntax enable           " enable syntax highlighting


" WORKSPACE SETTINGS

filetype indent on      " load filetype-specific indent files
set wildignore+=*.swp   " ignore hidden files


" OS INTEGRATION

" fix OS X terminal meta-keys
let char = 'a'
while char <= 'z'
	exec "set <M-" . char . ">=\e" . char
	exec "imap \e" . char .   " <M-" . char . ">"
	let char = nr2char(char2nr(char) + 1)
endw


" KEYBOARD MAPPINGS

" duplicate line
nmap <M-S-d> :t.<CR>
" insert new line below cursor
nmap <M-o> o<Esc>
" insert new line above cursor
nmap <M-S-o> O<Esc>


" MACROS

runtime 'macros/matchit.vim'


" PLUGINS

" initialize plugin autoload mechanism
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:pluginsPath = s:path . "/plugins"

function! LoadPluginSet(path)
	execute 'source' a:path . "/plugins.vim"
	for filepath in split(globpath(a:path, "*.vimrc"), '\n')
		execute 'source' filepath
	endfor
endfunction

" start Vundle configuation
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" load Terminal mode plugins
call LoadPluginSet(s:pluginsPath . "/terminal")

" load GUI mode plugins
if has("gui_running")
	call LoadPluginSet(s:pluginsPath . "/gui")
endif

" end Vundle configuration
call vundle#end()
filetype plugin indent on

