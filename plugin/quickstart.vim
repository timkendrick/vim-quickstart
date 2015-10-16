if exists('g:quickstart_loaded')
	finish
endif
let g:quickstart_loaded = 1

" get plugin path
let s:path = g:quickstart_path . "/plugin"

" load .vimrc
execute 'source' s:path . "/.vimrc"

" load .gvimrc
if has("gui_running")
	execute 'source' s:path . "/.gvimrc"
endif

" define install command
command! -nargs=0 QuickstartInstall call quickstart#install()
