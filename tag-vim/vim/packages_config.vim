" tpope/vim-fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" vim-rooter
" (cd is default mapping, dup'd here for explicitness)
"map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectory
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1

" vim-grepper
nnoremap <leader>a :Grepper -tool ag<cr>
nnoremap <leader>r :Grepper -tool rg<cr>


" vimwiki
nnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
vnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
let g:vimwiki_use_calendar = 1
"let g:vimwiki_url_maxsave = 20
let g:vimwiki_url_maxsave = 0
"let g:vimwiki_conceallevel = 2
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_tags': 1}]


" Shougo/unite.vim
source ~/.vim/unite_config.vim

" undotree
nnoremap <leader>U :UndotreeToggle<CR>
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" taskwarrior.vim
" TODO move plugin to /start
nnoremap <leader>t :TW<return>
let g:task_rc_override = 'rc.defaultwidth=0'
let g:task_default_prompt = ['description', 'priority', 'tag']
"let g:task_default_prompt = ['description', 'priority']
