if exists('g:quickstart_loaded')
	finish
endif
let g:quickstart_loaded= 1

" get current script path
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" load quickstart .vimrc
execute 'source' s:path . "/.vimrc"


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


" load quickstart .gvimrc
if has("gui_running")
	execute 'source' s:path . "/.gvimrc"
endif
