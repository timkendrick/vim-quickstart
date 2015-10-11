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

" initialize Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" load Terminal mode plugins
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-abolish'
Plugin 'matze/vim-move'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'

let g:move_key_modifier = 'M'
let g:move_auto_indent = 0

" load IDE mode plugins
if has("gui_running")

	Plugin 'scrooloose/syntastic'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'rking/ag.vim'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'bling/vim-airline'
	Plugin 'scrooloose/nerdtree'
	Plugin 'Xuyuanp/nerdtree-git-plugin'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'editorconfig/editorconfig-vim'
	Plugin 'schickling/vim-bufonly'
	Plugin 'altercation/vim-colors-solarized'

	let g:ag_working_path_mode='r'

	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline#extensions#tabline#left_sep = ''
	let g:airline#extensions#tabline#left_alt_sep = '|'

	let g:ctrlp_working_path_mode = 0
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
		\ 'file': '\v\.(exe|so|dll)$'
		\ }

	let NERDTreeMouseMode=2
	let NERDTreeChDirMode=2
	let NERDTreeMinimalUI=1
	let NERDTreeShowHidden=1
	let NERDTreeQuitOnOpen=1
	let NERDTreeHijackNetrw=0
	let NERDTreeIgnore=['\.DS_Store$','\.git$']

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_javascript_checkers = ['eslint']
	let g:syntastic_error_symbol = "✘"
	let g:syntastic_warning_symbol = "⚠"
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

endif

" end Vundle configuration
call vundle#end()
filetype plugin indent on

