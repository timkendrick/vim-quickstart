" User Interface
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14,Monaco:h14
set background=dark
colorscheme solarized

" Hide left scrollbar
set guioptions-=L

" Highlight current line
set cursorline

" Show pending commands in status bar
set showcmd

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


" Key mappings

" Expand '%%' to current file path in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" Menu items

" Open a new buffer
nmap <D-t> :enew<CR>
amenu <silent> 10.300 &File.New\ Buffer <D-t>

" Revert buffer
amenu <silent> 10.311 &File.Revert :e!<CR>

" Close the current buffer
nmap <D-w> :BufferClose<CR>
amenu <silent> 10.333 &File.Close\ Buffer <D-w>

" Close other buffers
nmap <D-∑> :BufOnly<CR>
amenu <silent> 10.333 &File.Close\ Others <D-∑>

" Toggle file explorer
nmap <D-1> :NERDTreeToggle<CR>
amenu <silent> 9998.365 Window.File\ Explorer <D-1>
amenu 9998.366 Window.-SEP3- <Nop>


" MacVim menu items
if has("gui_macvim")

	" Remap existing menu bindings
	macmenu File.New\ Tab key=<nop>
	macmenu File.Close key=<nop>
	macmenu File.Print key=<nop>
	macmenu Edit.Find.Use\ Selection\ for\ Find key=<nop>
	macmenu Window.Select\ Previous\ Tab key=<nop>
	macmenu Window.Select\ Next\ Tab key=<nop>
	macmenu Buffers.Next key=<D-}>
	macmenu Buffers.Previous key=<D-{>

	" Add custom menu bindings
	macmenu File.New\ Buffer key=<D-t>
	macmenu File.Revert
	macmenu File.Close\ Buffer key=<D-w>
	macmenu File.Close\ Others key=<D-M-w> alt=YES
	macmenu Window.File\ Explorer key=<D-1>
endif
