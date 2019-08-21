" OBSOLETE: maintained only for historical/facme purposes

" Use unite.vim and ag to find files quickly
let g:unite_source_history_yank_enable = 1

" Fuzzy-search for a file in the current working directory
nnoremap <Leader>f :<C-u>Unite -start-insert file_rec/async:!<cr>
" (version without async, incase you don't have it available
"nnoremap <Leader><Leader> :<C-u>Unite -start-insert file_rec<cr>

" Fuzzy-search for a file in the MRU cache
nnoremap <Leader>e :<C-u>Unite -start-insert file_mru<cr>

" open buffer list(easybuffer replacement)
nnoremap <leader>` :<C-u>Unite buffer<cr>

" requires vim-anzu
" enables unite buffer of current regex search
nnoremap <leader>/ :<C-u>Unite anzu<cr>

" requires unite-outline , Shougo warns that it only works with ctags languages
"nnoremap <Leader>o :<C-u>Unite -start-insert outline<cr>

" Reqires neoyank, can potentially slow down vim
"nnoremap <leader>y :<C-u>Unite history/yank<cr>

" not useful?
"nnoremap <leader>y :<C-u>Unite history/unite<cr>


" are these even useful?
" Custom mappings for the unite buffer
"autocmd FileType unite call s:unite_settings()
"function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  "imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  "imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"endfunction
