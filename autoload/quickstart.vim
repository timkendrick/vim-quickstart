let g:quickstart_path = expand('<sfile>:p:h:h')

function! quickstart#init(...)

	" get plugin list
	let plugins_path = g:quickstart_path . "/plugins"
	let plugins_terminal = readfile(plugins_path . "/terminal/plugins.txt")
 	let plugins_gui = has("gui_running") ? readfile(plugins_path . "/gui/plugins.txt") : []
	let plugins_user = a:0 < 1 ? [] : a:1

	" load plugins
	call s:LoadPlugins(plugins_terminal + plugins_gui + plugins_user)

	" load Terminal mode config
	call s:LoadConfigSet(l:plugins_path . "/terminal/config")

	" load GUI mode config
	if has("gui_running")
		call s:LoadConfigSet(l:plugins_path . "/gui/config")
	endif

endfunction

function! quickstart#install()
	" ensure all plugins are loaded
	if !has("gui_running")
		let plugins_path = g:quickstart_path . "/plugins"
		let plugins_gui = readfile(plugins_path . "/gui/plugins.txt")

		filetype off
		for plugin in plugins_gui
			Plugin plugin
		endfor
		filetype plugin indent on
	endif

	" install Vundle plugins
	PluginInstall
endfunction

function! s:LoadPlugins(plugins)
	" start Vundle configuation
	filetype off
	if &runtimepath !~ "Vundle"
		set runtimepath+=~/.vim/bundle/Vundle.vim
		call vundle#begin()
		Plugin 'VundleVim/Vundle.vim'
	else
		let g:vundle#lazy_load = 1
	endif

	" add quickstart to list of installed plugins
	Plugin 'timkendrick/vim-quickstart'

	" load user plugins
	for plugin in a:plugins
		Plugin plugin
	endfor

	" end Vundle configuration
	call vundle#end()
	filetype plugin indent on
endfunction

function! s:LoadConfigSet(path)
	for filepath in split(globpath(a:path, "*.vimrc"), '\n')
		execute 'source' filepath
	endfor
endfunction
