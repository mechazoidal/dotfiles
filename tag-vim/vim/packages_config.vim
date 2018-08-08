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

" gundo.vim
nnoremap <F5> :GundoToggle<CR>

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
"source ~/.vim/neocomplete_config.vim
"source ~/.vim/neocomplete_config2.vim

" youcompleteme
"source ~/.vim/completion.vim
"source ~/.vim/youcompleteme_conf.vim

" scrooloose/syntastic
source ~/.vim/syntastic_config.vim
"source ~/.vim/ultisnips_config.vim

