" tpope/vim-fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" vim-rooter
" (cd is default mapping, dup'd here for explicitness)
"map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectory
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1


" vim-grepper
" Use smart-case for rg
runtime plugin/grepper.vim
let g:grepper.rg.grepprg .= ' --smart-case'
" mappings
nnoremap <leader>a :Grepper -tool ag<cr>
nnoremap <leader>r :Grepper -tool rg<cr>
" Enables using "gs" as an operator to populate the search prompt
" (eg. 'gsiw' to search for the word under cursor)
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)


" vimwiki
nnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
vnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
let g:vimwiki_use_calendar = 1
"let g:vimwiki_url_maxsave = 20
let g:vimwiki_url_maxsave = 0
"let g:vimwiki_conceallevel = 2
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_tags': 1}]
let g:vimwiki_table_mappings = 0

" zeal
" TODO investigate investigate.vim
" quick-n-dirty way to use the zeal documentation browser
nnoremap gz :!zeal "<cword>"&<CR><CR>


" fzf and fzf.vim
" (Note that the macports fzf is automatically added to vim/macvim
" path)

" Open fuzzy-search, leave a space for faster typing of search path
nnoremap <Leader>f :Files 

" Fuzzy-search for current Git files
nnoremap <Leader>g :GFiles<cr>
" Fuzzy-search in v:oldfiles and all open buffers
nnoremap <Leader>e :History<cr>
" open buffer list
nnoremap <leader>` :Buffers<CR>

" Reduce default size of fzf window
let g:fzf_layout = { 'down': '~15%' }

" match color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" undotree
nnoremap <leader>U :UndotreeToggle<CR>
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif


" taskwarrior.vim
nnoremap <leader>t :TW<return>
let g:task_rc_override = 'rc.defaultwidth=0'
let g:task_default_prompt = ['description', 'priority', 'tag']
"let g:task_default_prompt = ['description', 'priority']

" supertab
" TODO it would be nice to have completion-chaining, but it seems like it
" always ignores it when used with LanguageClient!
let g:SuperTabSetDefaultCompletionType = "context"

" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
  \ 'rust': ['~/.cargo/bin/rls'],
  \ 'go': ['~/go/bin/gopls'],
  \ 'ruby': ['~/.gem/ruby/2.6/bin/solargraph26','stdio']
  \ }

" for using 'gq' formatting
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

" Only use LanguageClient for completion, not automatic linting
let g:LanguageClient_diagnosticsEnable=0
function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
  " doesn't seem to work?
  " for using 'gq' formatting
  " setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
endfunction()

" Only enable LanguageClient shortcuts and formatting for certain filetypes
augroup LSP
  autocmd!
  autocmd FileType rust,ruby,go call SetLSPShortcuts()
augroup END


" Shougo/echodoc.vim
" Enables type-signature display for LanguageClient
" (Note that cmdheight could be reduced if we want to give up 'showmode')
" set cmdheight=2
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'signature'


" ultisnips
let g:ulti_expand_or_jump_res = 0 "default value, just set once

" remap ultisnips trigger to explicit C-j, to avoid conflicts with supertab or
" LSP
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

