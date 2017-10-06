" No need to conform to vi
set nocompatible

" Must deactivate filetype when loading bundle-mgmt
" (the extra 'on' is to prevent errors in stock OSX vim)
filetype on
filetype off

" Load minpac bundle management
source ~/.vim/packages.vim

" Reactivate filetypes after bundle mgmt.
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" I think this is automatically set?
syntax on " syntax highlighting

" Nobody really needs modelines, especially with security issue
set modelines=0

" Set tabstops globally instead of using after/ftplugin
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Sanity settings
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
"set wildmode=list:longest "original
"set wildmode=longest,list,full "fullest
set wildmode=longest,list " bash
"set wildmode=longest:full,full " another bash?
set wildmenu
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber " requires Vim 7.3!
set number " requires Vim 7.4!

" FIXME what about openbsd
"set shell=bash

" Disable cursor blinking
set gcr=a:blinkon0

" Don't show these filetypes in wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class

" Use case-sensitive search if one-or-more uppercase chars
set ignorecase

" 'ignorecase' does not play nicely with completion
" (requires modern Vim!)
" FIXME seems to confuse Unite's completion in subbuffer, like <leader>e ?
"set infercase
"set smartcase

" Apply substitutions globally on lines (i.e., always assume /foo/bar/g)
set gdefault

" Highlite search results incrementally
set incsearch
set showmatch
set hlsearch

" Line wrapping
set wrap
" requires Vim 8+
set breakindent " indent wrapped lines, by...
set breakindentopt=shift:4,sbr " indenting them another level and showing 'showbreak' char
" see .gvimrc for showbreak and listchars
"set showbreak=↪
" with breakindent+relativenumber, display line movements unless preceded by a count
" (and save movements larger than 5 lines to the jumplist)
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Allow 'gq', automatically insert comment leader in Insert, recognize list numbers
set formatoptions=qrn1
"set colorcolumn=100 " visual warning if longer than 100 chars in line

" optimization: only syntax highlight the first 200 characters of each line
set synmaxcol=200

" Show invisible characters(tab, EOL)
set list
" FIXME move this to gvimrc, as terminal use requires the font installed
"set listchars=tab:▸\ ,eol:¬

" Don't warn about files changing out from under us
set autoread


" Key mappings
" Change leader
let mapleader = "\<Space>"

" Change default regex to use \v
nnoremap / /\v
vnoremap / /\v

" Clear out search results
nnoremap <leader>, :noh<cr>

" Match bracket pairs with <tab>
nnoremap <tab> %
vnoremap <tab> %

" Make ; do the same thing as :
nnoremap ; :

" Autosave on losing focus
au FocusLost * :wa

if has('macunix')
  " Disable middle mouse to avoid pasting problems on OSX
  map <MiddleMouse> <Nop>
  imap <MiddleMouse> <Nop>
end

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" use jj to exit insert mode
inoremap jj <ESC>
" Window-splitting helpers
" Split vertically with <leader>w
nnoremap <leader>w <C-w>v<C-w>l
" Split horizontally with <leader>v
nnoremap <leader>v <C-w>s<C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" force detection of *.md to Markdown, not modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" fold tags with ,ft
"nnoremap <leader>ft Vatzf

" Reselect just-pasted text with ,v
"nnoremap <leader>v V`]


" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" SWP files and friends
" Write undo/swap files to a vim-specific temp dir
set backupdir=$HOME/.vtemp//
set directory=~/.vtemp//,/tmp
set undodir=~/.vtemp//
set viminfo+=n~/.vtemp/viminfo
" Skip /tmp and /private since changing anything there needs edit-in-place
set backupskip=/tmp/*,/private/tmp/*
" Automatically recover+delete swap files if reopening after a crash
augroup AutomaticSwapRecoveryAndDelete
    autocmd!
    autocmd SwapExists * :let v:swapchoice = 'r' | let b:swapname = v:swapname
    autocmd BufWinEnter * :if exists("b:swapname") | call delete(b:swapname) | unlet b:swapname | endif
augroup end

" automatically equalize splits on resize
autocmd VimResized * wincmd =

if has('cscope')
  source ~/.vim/cscope.vim
endif

" ?
if has('')
  au BufWrite * :Autoformat
  let g:autoformat_autoindent = 0
  let g:autoformat_retab = 0
endif

let asmsyntax='armasm'
let filetype_inc='armasm'


" kill buffer without closing split
command Bd bp\|bd \#

" Taken from vim manual
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
" Shift-tab reverses if in a completion menu
function! CleverTabR()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-P>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
inoremap <S-Tab> <C-R>=CleverTabR()<CR>


" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location list is empty"
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>


" from sensible.vim
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" only useful for writing text
function! SpellCheckToggle()
  if &spell == 0
    setlocal spell
    set spelllang=en_us
    setlocal complete+=kspell
  else
    setlocal nospell
    setlocal complete-=kspell
  endif
endfunction


" load package-specific configs
source ~/.vim/packages_config.vim

" Enable if you have eclim separately installed
"source ~/.vim/eclim.vim
