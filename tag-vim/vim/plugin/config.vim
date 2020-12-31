" tpope/vim-fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" leave a space at the end for quicker entering of git cmd
nnoremap <leader>G :Git 


" vim-rooter
let g:rooter_cd_cmd="lcd"
let g:rooter_silent_chdir = 1
let g:rooter_change_directory_for_non_project_files = 'current'


" vim-grepper
runtime plugin/grepper.vim
let g:grepper.rg.grepprg .= ' --smart-case'
" mappings
nnoremap <leader>a :Grepper -tool ag<cr>
nnoremap <leader>r :Grepper -tool rg<cr>
" Enables using "gs" as an operator to populate the search prompt
" (eg. 'gsiw' to search for the word under cursor)
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
let g:grepper.dir = 'repo,filecwd'


" vimwiki
let g:vimwiki_use_calendar = 1
let g:vimwiki_url_maxsave = 0
let diary_wiki = {}
let diary_wiki.path = '~/personalwiki'
let diary_wiki.auto_tags = 1
let diary_wiki.auto_diary_index = 1
let notes_wiki = {}
let notes_wiki.path = '~/notewiki'
let notes_wiki.auto_tags = 1
let g:vimwiki_list = [diary_wiki, notes_wiki]
let g:vimwiki_table_mappings = 0
function SetExtraVimwikiMappings()
  nnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
  vnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
endfunction()

augroup filetype_vimwiki
  autocmd!
  " autocmd FileType vimwiki call SetExtraVimwikiMappings()
  autocmd FileType vimwiki nnoremap <buffer> <silent> <leader>m :VimwikiToggleListItem<CR>
  autocmd FileType vimwiki vnoremap <buffer> <silent> <leader>m :VimwikiToggleListItem<CR>
augroup END

" zeal
" TODO investigate investigate.vim
" quick-n-dirty way to use the zeal documentation browser
" nnoremap gz :!zeal "<cword>"&<CR><CR>


" fzf and fzf.vim
" (Note that the macports fzf is automatically added to vim/macvim
" path)

" taken from rooter.txt, uses FindRootDirectory from vim-rooter
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(FindRootDirectory(), fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

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
" nnoremap <leader>t :TW<return>
" let g:task_rc_override = 'rc.defaultwidth=0'
" let g:task_default_prompt = ['description', 'priority', 'tag']
"let g:task_default_prompt = ['description', 'priority']

" supertab
" TODO it would be nice to have completion-chaining, but it seems like it
" always ignores it when used with LanguageClient!
" let g:SuperTabSetDefaultCompletionType = "context"
" let g:SuperTabSetDefaultCompletionType = "<c-x><c-i>"
" let g:SuperTabContextDefaultCompletionType = "<c-i>"

" " mucomplete
" set completeopt+=menuone
" set shortmess+=c " shut off completion messages
" " give LanguageClient time to work
" let g:mucomplete#completion_delay = 50
" let g:mucomplete#reopen_immediately = 0

" let g:mucomplete#no_mappings = 1
" FIXME these are read _before_ mucomplete loads, so they are ignored
" need to load them AFTER mucomplete
" TODO scoped chains for go: omnicomplete for some, keyword/dict inside
" comment, etc.
"       \ 'go'      : ['omni', 'keyn', 'c-p'],
" \ 'default' : ['path', 'omni', 'keyn', 'dict', 'uspl'],
" let g:mucomplete#chains = {
"       \ 'vimwiki' : { 'default' : ['omni', 'keyn', 'tags', 'dict'] },
"       \ 'go'      : { 'default' : ['omni', 'keyn', 'tags'],
"       \ 'goString.*' : [],
"       \ 'goComment.*' : ['keyn', 'spel'] }
"       \ }

" Enable Golang omnicomplete after two keyword chars OR a keyword char + '.'
" ('t' represents text before cursor)
" let g:mucomplete#can_complete = {}
" let g:mucomplete#can_complete.go = { 'omni': { t -> t =~# '\m\k\%(\k\|\.\)$' } }

" imap <c-m> <plug>(MUcompleteFwd)
" imap <c-n> <plug>(MUcompleteBwd)

" allow extending completion using arrow-keys
" imap <expr> <right> mucomplete#extend_fwd("\<right>")
" imap <expr> <left> mucomplete#extend_bwd("\<left>")

" LanguageClient-neovim
" let g:LanguageClient_serverCommands = {
"   \ 'rust': ['~/.cargo/bin/rls'],
"   \ 'go': ['~/go/bin/gopls'],
"   \ 'ruby': ['~/.gem/ruby/2.6/bin/solargraph26','stdio'],
"   \ 'javascript': ['~/.yarn/bin/javascript-stdio']
"   \ }

" \ 'terraform': ['/opt/local/bin/terraform-ls', 'serve'],
" for using 'gq' formatting
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

" Only use LanguageClient for completion, not automatic linting
" let g:LanguageClient_diagnosticsEnable=0
" function SetLSPShortcuts()
"   nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
"   nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
"   nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
"   nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
"   nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
"   nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
"   nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
"   nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
"   nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
"   nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
"   " doesn't seem to work?
"   " for using 'gq' formatting
"   " setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
" endfunction()

" Only enable LanguageClient shortcuts and formatting for certain filetypes
" augroup LSP
"   autocmd!
"   autocmd FileType rust,ruby,go,python,javascript call SetLSPShortcuts()
"   autocmd FileType rust,ruby,go,python,javascript setlocal completefunc=LanguageClient#complete
" augroup END

" Can't define these in after/ftplugin as they are plugin-specific
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
  autocmd FileType vimwiki call lexical#init({ 'spell': 0 })
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
" let g:UltiSnipsExpandTrigger = '<C-j>'
" let g:UltiSnipsJumpForwardTrigger = '<C-j>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" remap dictionary completion trigger
inoremap <c-x><c-k> <c-x><c-k>


" dense-analysis/ale
" let LanguageClient-neovim handle LSP
let g:ale_disable_lsp = 1
let g:ale_linters = {'go': ['golangci-lint']}
" let g:ale_linters_ignore = {'go': ['pylint']}
" let g:ale_go_golangci_lint_options = '-c PATH'
" let g:ale_go_golangci_lint_options = ''
" let g:ale_go_golangci_lint_options = '--fast'
let g:ale_go_golangci_lint_options = '--fast --presets bugs,format,style,unused --disable godot,unused,lll,wsl' "'-c PATH'
let g:ale_go_golangci_lint_package = 1


" tpope/vim-projectionist
" let l:proj_json = readfile("~/.vim/plugin/projections.json")
" let l:proj_dict = projectionist#json_parse(l:proj_json)
" let g:projectionist_heuristics = l:proj_dict
 let g:projectionist_heuristics = {
       \  ".git/|.git": {}
       \ }
