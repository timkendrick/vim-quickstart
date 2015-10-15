if exists('g:quickstart_loaded_vimrc')
    finish
endif
let g:quickstart_loaded_vimrc = 1


" EDITOR SETTINGS

set nocompatible                       " enable Vim mode
set number                             " show line numbers
set relativenumber                     " show relative line numbers
set showcmd                            " show most recent command in bottom bar
set wildmenu                           " visual autocomplete for command menu
set showmatch                          " highlight matching braces
set incsearch                          " incremental search
set hlsearch                           " highlight current search term
set nrformats=                         " set number format to decimal
set updatetime=250                     " editor update debounce
set history=200                        " number of commands to store in history
syntax enable                          " enable syntax highlighting


" WORKSPACE SETTINGS

filetype indent on                     " load filetype-specific indent files
set wildignore+=*.swp                  " ignore hidden files
set backup                             " activate backups
set undofile                           " activate persistent undo
set directory=$TMPDIR//,$TMP//,$TEMP// " set swap directory
set backupdir=$TMPDIR,$TMP,$TEMP       " set backup directory
set undodir=$TMPDIR,$TMP,$TEMP         " set undo directory


" OS INTEGRATION

" fix OS X terminal meta-keys
if !has("gui_running")
	let char = 'a'
	while char <= 'z'
		exec "map <Esc>" . char . " <M-" . char . ">"
		exec "map <Esc>" . toupper(char) . " <M-S-" . char . ">"
		let char = nr2char(char2nr(char) + 1)
	endw
	" prevent <M-S-o> from clobbering arrow keys
	unmap <Esc>O
endif


" KEYBOARD MAPPINGS

" reuse flags when repeating last substitution
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" duplicate line
nmap <M-S-d> :t.<CR>

" search for visual selection
xnoremap * :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>/<C-r>=@/<CR><CR>
xnoremap # :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>#<C-r>=@/<CR><CR>

function! s:PopulateSearchRegisterFromVisualSelection()
	let existing_register_value = @0
	normal! gvy
	let @/ = '\V' . substitute(escape(@0, '/\'), '\n', '\\n', 'g')
	let @0 = existing_register_value
endfunction


" MACROS

runtime 'macros/matchit.vim'


" PLUGINS

" initialize plugin autoload mechanism
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:plugins_path = s:path . "/plugins"

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
call LoadPluginSet(s:plugins_path . "/terminal")

" load GUI mode plugins
if has("gui_running")
	call LoadPluginSet(s:plugins_path . "/gui")
endif

" end Vundle configuration
call vundle#end()
filetype plugin indent on
