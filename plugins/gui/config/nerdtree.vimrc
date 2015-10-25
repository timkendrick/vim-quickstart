let g:NERDTreeMouseMode=2
let g:NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeIgnore=['\.DS_Store$','\.git$']

autocmd User ProjectOpen call <SID>ShowFileExplorerOnStartup()
autocmd VimLeavePre * call <SID>HideFileExplorerBeforeExit()

function! s:ShowFileExplorerOnStartup()
	let is_single_buffer = bufnr('%') == bufnr('$')
	let cwd = getcwd()
	let is_file_explorer = is_single_buffer && (bufname('%') == cwd) || (bufname('%') == cwd . '/')
	if is_file_explorer
		bwipe
	end
	let is_empty_buffer = is_single_buffer && (bufname('%') == '')
	if is_empty_buffer
		NERDTree
	endif
endfunction

function! s:HideFileExplorerBeforeExit()
	NERDTreeClose
endfunction
