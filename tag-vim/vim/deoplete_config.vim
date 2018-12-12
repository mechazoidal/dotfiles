" Deoplete
"iunmap <Tab>
"iunmap <S-Tab>

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" For deoplete-rust
"let g:deoplete#sources#rust#racer_binary = "~/.cargo/bin/racer"
"let g:deoplete#sources#rust#rust_source_path = "~/src/rustc-1.24.0-src/src"

" Don't allow autocomplete in vimwiki files
autocmd FileType vimwiki
       \ call deoplete#custom#buffer_option('auto_complete', v:false)
