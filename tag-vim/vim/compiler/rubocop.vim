" Vim compiler file for rubocop
" mostly copied from $VIM/compiler/rake.vim

if exists("current_compiler")
  finish
endif
let current_compiler = "rubocop"

if exists(":CompilerSet") != 2  
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

" use emacs formatter to parse it easier
CompilerSet makeprg=rubocop\ --format\ emacs

CompilerSet errorformat=\%f:%l:%c:\ %t:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
