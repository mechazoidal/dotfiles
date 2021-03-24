" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" The core fzf plugin needs to be enabled BEFORE the fzf.vim package is loaded
" (the conditional is just a kludge to test if we're on osx or a unix)
if isdirectory('/opt')
  set runtimepath+=/opt/local/share/fzf/vim/
else
  set runtimepath+=/usr/local/share/fzf/vim
endif
" PLUGINS: LOAD
" (vim-plug standard path: ~/.local/share/nvim/site/autoload/plug.vim)
call plug#begin('~/.local/share/nvim/site/vim-plug')
Plug 'jnurmine/Zenburn'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-grepper'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth' 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
" neovim-specific support for vim-dispatch
" BUT see https://github.com/tpope/vim-dispatch/issues/163#issuecomment-175787326
" Plug 'radenling/vim-dispatch-neovim' 
Plug 'vim-scripts/scratch.vim'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-wordy'
" Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
" Plug 'fatih/vim-go'
" Plug 'Shougo/deoplete.nvim'

" NOT WORKING: requires base neovim of 0.5+
" Plug 'neovim/nvim-lsp'
" OLD, EVALUATING
" Plug 'vim-scripts/ag.vim'
call plug#end()

" TODO ported from vimrc
set modelines=0                " security issues with modelines, etc.

" Don't fiddle with tabstop, just customize shiftwidth/softtabs
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolloff=3
set showmode
set hidden
set wildmode=longest:full,full
set visualbell
" Allow 'gq', automatically insert comment leader in Insert, recognize list numbers
" nvim default: tcqj
set formatoptions=qrn1
set spelllang=en_us            " Default spelling is US English
set list                       " Show invisible characters(tab, EOL)

" FIXME needed in nvim? (backupdir, directory, undodir already set)
" set viminfo+=n~/.vtemp/viminfo

" Don't show these filetypes in wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class

set ignorecase                 " Use case-sensitive search if one-or-more uppercase chars
set showmatch
set hlsearch
set wrap                       " Line wrapping...
set breakindent                " and indent wrapped lines by...
set breakindentopt=shift:4,sbr " indenting them another level and showing 'showbreak' char

" Allow 'gq', automatically insert comment leader in Insert, recognize list numbers
" nvim default: tcqj
set formatoptions=qrn1
set tildeop                    " Allow '~' to be used as an operator

" gvimrc settings
set guioptions-=r              " remove scrollbars
"set guifont=Inconsolata-dz:h14
"set transparency=4
"set anti                       " anti-aliased fonts where possible
set guioptions-=T              " remove toolbar
set listchars=tab:▸\ ,eol:¬
set showbreak=↪

colorscheme zenburn            " Alien fruit salad 4 life

" BINDINGS:
let mapleader = "\<Space>"
" Clear out search results
nnoremap <leader>, :noh<cr>
nnoremap ; :

" with breakindent+relativenumber, display line movements unless preceded by a count
" (and save movements larger than 5 lines to the jumplist)
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" change all smart quotes to their ascii equivs(", ')
" (does not use /g since 'gdefault' is now always on)
nnoremap <leader>Q :%s/\%u201c/"/<cr>:%s/\%u201d/"/<cr>:%s/\%u2019/'/<cr>:%s/\%u2018/'/<cr>:let @/=''<CR>
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

" courtesy of steve losh
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Make Y apply from cursor to end of line
nnoremap Y y$

" Autocmds
" Default augroup for autocmds defined in vimrc
augroup vimrc
  autocmd!
augroup end

" force detection of *.md to Markdown, not modula-2
" FIXME still needed?
" autocmd vimrc BufNewFile,BufReadPost *.md set filetype=markdown

" Autosave on losing focus
autocmd vimrc FocusLost * :wa

" automatically equalize splits on resize
autocmd vimrc VimResized * wincmd =

" neovim-specific
let g:python3_host_prog = '/opt/local/bin/python3'  " isolate neovim's python from any venvs
let g:node_host_prog = '/opt/local/bin/node'

" NEEDS UPDATE
" FIXME because these are called from vimrc, they don't seem to work if moved
" to an autoload script
" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
function! GetBufferList() abort
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx) abort
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

" PLUGINS: CONFIG
" (was $VIMRC/plugin/config.vim)
" tpope/vim-fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" vim-grepper
runtime plugin/grepper.vim " Use smart-case for rg
let g:grepper.rg.grepprg .= ' --smart-case'
" mappings
nnoremap <leader>a :Grepper -tool ag<cr>
nnoremap <leader>r :Grepper -tool rg<cr>
" Enables using "gs" as an operator to populate the search prompt
" (eg. 'gsiw' to search for the word under cursor)
nmap gs  <plug>(GrepperOperator)

" fzf.vim
" Open fuzzy-search, leave a space for faster typing of search path
nnoremap <Leader>f :Files 

" Fuzzy-search for current Git files
nnoremap <Leader>g :GFiles<cr>
" Fuzzy-search in v:oldfiles and all open buffers
nnoremap <Leader>e :History<cr>
" open buffer list
nnoremap <leader>` :Buffers<CR>

" Reduce default size of fzf window
let g:fzf_layout = { 'down': '~15%' }

" match color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" undotree
nnoremap <leader>U :UndotreeToggle<CR>
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" vim-rooter
" (default mapping, provided for reference)
"map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectory
let g:rooter_use_lcd = 1                            " use only :lcd, never :cd or :tcd
let g:rooter_silent_chdir = 1                       " don't echo project dir each time

" vim-lexical
" FIXME: Can't define these in a separate after/ftplugin as they are plugin-specific?
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
  autocmd FileType vimwiki call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#thesaurus = ['$HOME/.local/share/nvim/site/thesaurus/mthesaur.txt',]

" go-vim
let g:go_code_completion_enabled = 0

" TODO use local server
" let g:go_doc_url = 'https://pkg.go.dev'

" ultisnips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" deoplete
" let g:deoplete#enable_at_startup = 1
" use tab to forward cycle 
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle 
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>" 

" nvim-lsp
" REQUIRES base neovim of 0.5+
" require'nvim_lsp'.gopls.setup{}


" DEPRECATED
" set gdefault                   " always assume /foo/bar/g
" set gcr=a:blinkon0           " Disable cursor blinking

