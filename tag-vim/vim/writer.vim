" Built-in vim settings
"
set completeopt=longest,menuone
"set complete+=kspell

" Plugins
packadd! vim-pencil

" TODO get lexical options from packages_config_opt

"function! SpellCheckToggle()
  "if &spell == 0
    "setlocal spell
    "set spelllang=en_us
    "setlocal complete+=kspell
  "else
    "setlocal nospell
    "setlocal complete-=kspell
  "endif
"endfunction

packadd! vim-lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
  autocmd FileType vimwiki call lexical#init({ 'spell': 0 })
augroup END

" vim-lexical thesaurus default
" ( curl https://raw.githubusercontent.com/words/moby/master/words.txt --create-dirs -o ~/.vim/thesaurus/mthesaur.txt ) 

" no configuration needed
packadd! Wordnet.vim
" wordnet locations:
" openbsd: /usr/local/share/wordnet/

" no configuration needed
packadd! vim-wordy
