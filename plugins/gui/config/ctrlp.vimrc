let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.tmp|node_modules)$',
	\ 'file': '\v\.(exe|so|dll|DS_Store)$'
	\ }

nmap <D-r> <F5>
nmap <D-P> :CtrlPBuffer<CR>
