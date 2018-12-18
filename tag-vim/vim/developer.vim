" deoplete configuration
" Do NOT mess with packadd/enable order for deoplete!
packadd! deoplete.nvim
packadd! deoplete-rust
packadd! nvim-yarp
packadd! vim-hug-neovim-rpc
let g:deoplete#enable_at_startup = 1

packadd! neosnippet.vim
packadd! neosnippet-snippets
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

" Don't allow autocomplete in vimwiki files
autocmd FileType vimwiki
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" end deoplete/neosnippets


packadd! jedi-vim
" jedi.vim
" TODO the deoplete-jedi plugin requires nvim, not sure how well they play
" together without it
let g:jedi#auto_initialization = 0
let g:jedi#show_call_signatures = "2"
"let g:jedi#completions_enabled = 0


" ale
packadd! ale
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

" Disable completion for wiki files
let g:ale_pattern_options = {'\.wiki$': {'ale_enabled': 0}}


" cscope
let g:autocscope_menus = 1
packadd! autoload_cscope.vim

" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
" show msg when any other cscope db added
set cscopetag cscopeverbose

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" Mappings
" 's'   symbol: find all references to the token under cursor
" 'g'   global: find global definition(s) of the token under cursor
" 'c'   calls:  find all calls to the function name under cursor
" 't'   text:   find all instances of the text under cursor
" 'e'   egrep:  egrep search for the word under cursor
" 'f'   file:   open the filename under cursor
" 'i'   includes: find files that include the filename under cursor
" 'd'   called: find functions that function under cursor calls

nmap <Leader>cfs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cfg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cfc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cfe :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>cfi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <Leader>cfd :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <Leader>vfs :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>vfg :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>vfc :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>vft :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>vfe :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>vff :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>vfi :scs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <Leader>vfd :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <Leader>wfs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>wfg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>wfc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>wft :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>wfe :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>wff :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>wfi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <Leader>wfd :vert scs find d <C-R>=expand("<cword>")<CR><CR>


" rainbow_parentheses.vim
packadd! rainbow_parentheses.vim
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

" Enable if you have eclim separately installed
"source ~/.vim/eclim.vim

" TODO is matchit still useful to us?
" Load matchit.vim, but only if the user hasn't installed a newer version.
" if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
"   runtime! macros/matchit.vim
" endif

" default ASM
let asmsyntax='armasm'
let filetype_inc='armasm'
