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

" Prevent using option key as meta key
if has("gui_macvim")
	set nomacmeta
endif


" Key mappings

" expand '%%' to current file path in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" Menu items

" open a new buffer
nmap <D-t> :enew<CR>
amenu <silent> 10.300 &File.New\ Buffer <D-t>

" revert buffer
amenu <silent> 10.311 &File.Revert :e!<CR>

" close the current buffer
nmap <D-w> :call <SID>CloseBuffer()<CR>
amenu <silent> 10.333 &File.Close\ Buffer <D-w>

" close other buffers
nmap <D-∑> :BufOnly<CR>
amenu <silent> 10.333 &File.Close\ Others <D-∑>

" toggle file explorer
nmap <D-1> :NERDTreeToggle<CR>
amenu <silent> 9998.365 Window.File\ Explorer <D-1>
amenu 9998.366 Window.-SEP3- <Nop>


function! s:CloseBuffer()
	let buffer_id = '%'
	let buffer_count = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
	let is_last_buffer = buffer_count == 1
	let is_empty_buffer = (bufname(buffer_id) == '') && !getbufvar(buffer_id, '&modified')
	if is_last_buffer && is_empty_buffer
		quit
	else
		confirm bdelete
	endif
endfunction


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
