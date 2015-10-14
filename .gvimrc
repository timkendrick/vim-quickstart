if exists('g:quickstart_loaded_gvimrc')
    finish
endif
let g:quickstart_loaded_gvimrc = 1

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

" Assign key mappings

" toggle NERDTree
nmap <M-Tab> :NERDTreeToggle<CR>

" switch to next buffer
nmap <M-}> :bnext!<CR>
" switch to previous buffer
nmap <M-{> :bprevious!<CR>
" open a new buffer
nmap <M-t> :enew<CR>
" close the current buffer
nmap <M-w> :bdelete<CR>
" close all other buffers
nmap <M-S-w> :BufOnly<CR>
" save all buffers
nmap <M-S-s> :wall<CR>

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
