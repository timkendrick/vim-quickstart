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
set lazyredraw                         " prevent unnecessary redraws
set ttyfast                            " improve redraw performance
syntax enable                          " enable syntax highlighting


" WORKSPACE SETTINGS

filetype indent on                     " load filetype-specific indent files
set wildignore+=*.swp                  " ignore hidden files
set backup                             " activate backups
set undofile                           " activate persistent undo
set directory=$TMPDIR//,$TMP//,$TEMP// " set swap directory
set backupdir=$TMPDIR,$TMP,$TEMP       " set backup directory
set undodir=$TMPDIR,$TMP,$TEMP         " set undo directory


" KEYBOARD MAPPINGS

" reuse flags when repeating last substitution
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" search for current selection
nnoremap <silent> <D-e> :<C-u>call <SID>PopulateSearchRegisterFromCurrentWord()<CR>
xnoremap <silent> <D-e> :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>:<C-u>normal! gv<CR>
xnoremap <silent> * :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>:<C-u>normal! /<C-r>=@/<CR><C-v><CR><CR>
xnoremap <silent> # :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>:<C-u>normal! ?<C-r>=@/<CR><C-v><CR><CR>

function! s:PopulateSearchRegisterFromCurrentWord()
	call s:PopulateSearchRegister('yiw')
endfunction

function! s:PopulateSearchRegisterFromVisualSelection()
	call s:PopulateSearchRegister('gvy')
endfunction

function! s:PopulateSearchRegister(command)
	let existing_register_value = @0
	execute 'normal! ' . a:command
	let @/ = '\V' . substitute(escape(@0, '/\'), '\n', '\\n', 'g')
	let @0 = existing_register_value
endfunction


" MACROS

runtime 'macros/matchit.vim'


" OS INTEGRATION

" map OS X terminal meta-keys to command-keys
if !has("gui_running")
	let keycode = 8
	while keycode < 128
		if keycode != char2nr('[') " mapping `<Esc>[` causes problems
			execute "map <Esc><Char-" . keycode . "> <D-Char-" . keycode . ">"
		endif
		let keycode = keycode + 1
	endw
endif
