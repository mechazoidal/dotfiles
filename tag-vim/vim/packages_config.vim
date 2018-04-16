" tpope/vim-fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" jedi.vim
let g:jedi#show_call_signatures = "2"
"let g:jedi#show_call_signatures = 2
"let g:jedi#completions_enabled = 0

" rainbow_parentheses.vim
"TODO is there a way to autoload these on file-types?
":RainbowParenthesesToggle       " Toggle it on/off
":RainbowParenthesesLoadRound    " (), the default when toggling
":RainbowParenthesesLoadSquare   " []
":RainbowParenthesesLoadBraces   " {}
":RainbowParenthesesLoadChevrons " <>
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
nnoremap <leader>R :RainbowParenthesesToggle<CR>

" vim-rooter
" (cd is default mapping, dup'd here for explicitness)
"map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectory
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1

" vim-grepper
nnoremap <leader>a :Grepper -tool ag<cr>
nnoremap <leader>r :Grepper -tool rg<cr>

" gundo.vim
nnoremap <leader>U :GundoToggle<CR>
if has('python3')
  let g:gundo_prefer_python3 = 1          
endif

" vimwiki
nnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
vnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
let g:vimwiki_use_calendar = 1
"let g:vimwiki_url_maxsave = 20
"let g:vimwiki_conceallevel = 0
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_tags': 1}]


" Shougo/unite.vim
"source ~/.vim/unite_config.vim
source ~/.vim/unite_config2.vim
" Shougo/deoplete.nvim
source ~/.vim/deoplete_config.vim

" taskwarrior.vim
" FIXME move to packages.vim/source
nnoremap <leader>t :TW<return>
let g:task_rc_override = 'rc.defaultwidth=0'
let g:task_default_prompt = ['description', 'priority', 'tag']
"let g:task_default_prompt = ['description', 'priority']


" not entirely sure this works for clang_complete
"let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'


"let g:slime_target = "tmux"
"let g:tslime_ensure_trailing_newlines = 1
"nmap <leader>t <Plug>NormalModeSendToTmux
"let g:tslime_normal_mapping = "<leader>t"
"let g:tslime_visual_mapping = "<leader>t"
"let g:tslime_vars_mapping = "<leader>v"
"vmap <leader>t <Plug>SendSelectionToTmux

"let g:tslime_always_current_session = 1
"let g:tslime_always_current_window = 1
"let g:vimshell_editor_command='/opt/local/bin/mvim'

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
  "autocmd FileType vimwiki call lexical#init()
augroup END

" FIXME Go commands
" ie, ':Go' that takes 'run', 'get', etc.
"augroup SetGoPath
  "autocmd FileType go :autocmd! User RooterChDir execute ":let $GOPATH = " . getcwd()
"augroup END

"augroup mygo
  "autocmd!
  " set GOPATH automatically
  "autocmd FileType go :set GOPATH=pwd
  "autocmd FileType go :autocmd! User doautocmd RooterChDir execute ":let $GOPATH = " . getcwd()
  "autocmd FileType go :autocmd! User doautocmd 
  "autocmd *RooterChDir* execute ":let $GOPATH = " . getcwd()
  "autocmd RooterChDir :autocmd! FileType go execute ":let $GOPATH = " . getcwd()

  " Run gofmt over current file on save, IF no errors detected
  "autocmd BufWrite *.go .,$!gofmt
  "autocmd BufWrite *.go !gofmt -w <afile>

  "autocmd BufWrite *.go ks|call NoLocList()|'s
  "function NoLocList()
    "if len(getloclist(0) == 0
      "execute !gofmt -w <afile>
    "endif
  "endfun
"augroup END
"augroup autoload_python_cscope
  "autocmd!
  ""autocmd FileType python :autocmd! User doautocmd RooterChDir execute "cscope#load_cscope()"
  ""autocmd FileType python :autocmd! User doautocmd RooterChDir execute "cscope#load_cscope()"

  "" WORKS
  "autocmd FileType python :autocmd! User RooterChDir call cscope#load_cscope()
"augroup END
"set autochdir
"augroup autoload_cscope
  "autocmd *RooterChDir* execute "cscope#load_cscope()"
  "autocmd RooterChDir :autocmd! FileType python execute "cscope#load_cscope()"

  " WORKS
  "autocmd User RooterChDir let g:test_user_autocmd = 1

  "autocmd User RooterChDir call cscope#load_cscope
"augroup END

" ALE
" quick activation toggle
"let g:ale_enabled = 0
" use quickfix instead of loclist for errors
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" only check on save
let g:ale_lint_on_text_changed = "normal"
"let g:ale_linters = {'rust': ['rustc']}
"let g:ale_rust_rls_toolchain = "stable"
"let g:ale_linters = {'rust': ['rls']}
" Turns off 'variable is never used'; only here to remind how it's used
"let g:ale_lua_luacheck_options = "--no-unused-args"

" Ocaml merlin setup
" (disabled)
"if executable('ocamlmerlin') && has('python')
  "let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/merlin"
  
  "execute "set rtp+=".s:ocamlmerlin."/vim"
  "execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
"endif
