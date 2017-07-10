" Syntastic 
" recommended by syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 "set to 1 for automatic open/close of Loc List
let g:syntastic_check_on_open = 0 "1 = autocheck on open: this may cause delay when opening
let g:syntastic_check_on_wq = 0 "don't bother syntax checking on :wq

" Keep the signcolumn/gutter active, instead of showing/hiding on demand (Vim 8.0)
set signcolumn=yes

" ocaml setup
" Merlin authors discourage installing through vundle, so install through OPAM first
"https://github.com/realworldocaml/book/wiki/Installation-Instructions
if executable('ocamlmerlin') && has('python')
  let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/merlin"
  
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
  let g:syntastic_ocaml_checkers = ['merlin']
endif

" Use luacheck if available
if executable('luacheck')
  let g:syntastic_lua_checkers = ['luacheck']
endif

if executable('go')
  let g:syntastic_go_checkers = ['govet']
endif
