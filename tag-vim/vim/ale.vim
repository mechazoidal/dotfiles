packadd ale
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
