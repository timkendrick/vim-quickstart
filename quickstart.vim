let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

execute 'source' s:path . "/.vimrc"
if has("gui_running")
	execute 'source' s:path . "/.gvimrc"
endif
