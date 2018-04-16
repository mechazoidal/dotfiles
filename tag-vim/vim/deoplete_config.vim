let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1
"let g:deoplete#complete_method = "omnifunc"

"inoremap <silent><expr> <TAB>
"\ pumvisible() ? "\<C-n>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ deoplete#mappings#manual_complete()
"function! s:check_back_space() abort "{{{
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}

let g:deoplete#sources#rust#racer_binary = "~/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path = "~/src/rustc-1.24.0-src/src"

let g:AutoPairsMapCR=0 
let g:deoplete#auto_complete_start_length = 1 
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"if has('conceal')
  "set conceallevel=2 concealcursor=niv
"endif


autocmd FileType vimwiki let b:deoplete_disable_auto_complete = 1
