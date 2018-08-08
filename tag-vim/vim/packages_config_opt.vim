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

" taskwarrior.vim
" FIXME move to packages.vim/source
nnoremap <leader>t :TW<return>
let g:task_rc_override = 'rc.defaultwidth=0'
let g:task_default_prompt = ['description', 'priority', 'tag']
"let g:task_default_prompt = ['description', 'priority']

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
  "autocmd FileType vimwiki call lexical#init()
augroup END

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

" Disable completion for wiki files
let g:ale_pattern_options = {'\.wiki$': {'ale_enabled': 0}}
