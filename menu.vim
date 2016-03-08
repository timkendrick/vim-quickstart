" Open a new buffer
nmap <D-t> :enew<CR>
amenu <silent> 10.300 &File.New\ Buffer <D-t>

" Revert buffer
amenu <silent> 10.311 &File.Revert :e!<CR>

" Close the current buffer
nmap <D-w> :BufferClose<CR>
amenu <silent> 10.333 &File.Close\ Buffer <D-w>

" Close other buffers
nmap <D-∑> :BufOnly<CR>
amenu <silent> 10.333 &File.Close\ Others <D-∑>

" Toggle file explorer
map <D-1> :NERDTreeToggle<CR>
amenu <silent> 9998.361 Window.File\ Explorer <D-1>

" Toggle quickfix panel
map <D-2> :TogglePanelQuickfixList<CR>
amenu <silent> 9998.362 Window.Quickfix\ List <D-2>

" Toggle location list panel
map <D-3> :TogglePanelLocationList<CR>
amenu <silent> 9998.363 Window.Location\ List <D-3>


amenu 9998.369 Window.-SEP3- <Nop>

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
	macmenu Window.Quickfix\ List key=<D-2>
	macmenu Window.Location\ List key=<D-3>
endif
