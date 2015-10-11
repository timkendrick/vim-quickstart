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

" Use option key as meta key
set macmeta

" Set to auto read when a file is changed from the outside.
set autoread

" Assign hotkey to toggle NERDTree
nmap <M-Tab> :NERDTreeToggle<CR>

" Assign hotkeys to switch between buffers
nmap <M-}> :bnext!<CR>
nmap <M-{> :bprevious!<CR>

" Assign hotkeys to close buffers
nmap <M-w> :bdelete<CR>
nmap <M-S-w> :BufOnly<CR>

" Expand '%%' to current file path in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Perform startup actions
function! StartUp()
	if (argc() == 1 && isdirectory(argv(0)))
		bdelete
		NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
