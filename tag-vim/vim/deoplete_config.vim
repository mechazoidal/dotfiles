" Deoplete
"iunmap <Tab>
"iunmap <S-Tab>

packadd deoplete.nvim
packadd deoplete-rust
packadd nvim-yarp
packadd vim-hug-neovim-rpc
"let g:deoplete#enable_at_startup = 1
call deoplete#enable()

packadd neosnippet.vim
packadd neosnippet-snippets

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
