" cscope
" adapted from http://cscope.sourceforge.net/cscope_maps.vim
" http://stackoverflow.com/questions/934233/cscope-or-ctags-why-choose-one-over-the-other

" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
" show msg when any other cscope db added
set cscopetag cscopeverbose

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" add any cscope database in current directory
" FIXME might not be needed since we have the autoload_cscope.vim bundle?
" http://stackoverflow.com/questions/13936480/use-the-current-directory-in-vim-commands
"if filereadable(fnamemodify("cscope.out", ':p:h:t'))
  "cs add fnamemodify(findfile("cscope.out"), ':p:h:t')
 ""else add the database pointed to by environment variable
"elseif $CSCOPE_DB != ""
  "cs add $CSCOPE_DB
"endif
"
" FIXME add map to determine which db's are loaded
" must load DB only ONCE per project
" (the cscope_loaded var is a cheap hack)
function! cscope#load_cscope()
  if !exists('g:cscope_loaded')
    if filereadable(fnamemodify("cscope.out", ':p'))
      " use RELATIVE path
      execute ":cs add " . fnamemodify("cscope.out", ':.')
      let g:cscope_loaded = 1
    "else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
      let g:cscope_loaded = 1
    endif
  endif
endfun

" from vim wikia ?
"if has('quickfix')
  "set cscopequickfix=s-,c-,d-,i-,t-,e-
"endif

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

"command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
