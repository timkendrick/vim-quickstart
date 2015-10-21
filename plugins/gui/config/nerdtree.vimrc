let g:NERDTreeMouseMode=2
let g:NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeIgnore=['\.DS_Store$','\.git$']

" Start with NERDTree panel expanded when opening folders
function! s:StartExpanded()
	if (argc() == 1 && isdirectory(argv(0)))
		bdelete
		NERDTree
    end
endfunction

autocmd VimEnter * call <SID>StartExpanded()
