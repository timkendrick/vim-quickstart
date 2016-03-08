" User Interface
set guifont=Meslo\ LG\ S\ for\ Powerline:h14,Menlo:14,Monaco:h14,Courier:h14
set background=dark
colorscheme solarized

" Hide left scrollbar
set guioptions-=L

" Always show tab bar
set showtabline=2

" Always show status bar
set laststatus=2

" Allow modified buffers to be hidden
set hidden

" Reload files when they are changed externally
set autoread

" Don't save configuration with sessions
set sessionoptions-=options

" Save window position with sessions
set sessionoptions+=winpos

" Prevent using option key as meta key
if has("gui_macvim")
	set nomacmeta
endif

" Load menu items
let s:path = expand('<sfile>:p:h')
execute "source" s:path . "/menu.vim"
