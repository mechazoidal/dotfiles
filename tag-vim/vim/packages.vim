packadd minpac
"silent! packadd minpac

"if exists('*minpac#init')
  " minpac is loaded.
  call minpac#init({'verbose': '1'})
  " minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
  " (also, must be frozen or else it tries to update itself during an initial
  " install)
  call minpac#add('k-takata/minpac', {'type': 'opt', 'frozen': '1'})

  call minpac#add('Shougo/unite.vim')
  call minpac#add('Shougo/neomru.vim')
" required for async use for unite, as it's not getting updates like denite
" FIXME needs GNU Make, so must be call to gmake, except do we need to guard
" on other systems?
  call minpac#add('Shougo/vimproc.vim', {'do': 'silent! !gmake'})

  " other unite plugins
  call minpac#add('osyo-manga/vim-anzu')
  call minpac#add('osyo-manga/unite-quickfix')

  " completion (these require the 'neovim' python3 library globally
  " available)
  call minpac#add('Shougo/deoplete.nvim')
  " since this is not neovim, we need adapters
  call minpac#add('roxma/nvim-yarp')
  call minpac#add('roxma/vim-hug-neovim-rpc')
  call minpac#add('sebastianmarkow/deoplete-rust')

  "in tandem with deoplete
  call minpac#add('Shougo/neosnippet')
  call minpac#add('Shougo/neosnippet-snippets')

  " async linting
  call minpac#add('w0rp/ale')

  " more in the spirit of vim than paredit
  call minpac#add('guns/vim-sexp')
  call minpac#add('airblade/vim-rooter')
  call minpac#add('vimwiki/vimwiki')
  
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-sexp-mappings-for-regular-people')
  "call minpac#add('tpope/vim-fireplace')
  
  call minpac#add('vim-scripts/ag.vim')
  call minpac#add('kien/rainbow_parentheses.vim')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('ConradIrwin/vim-bracketed-paste')
  call minpac#add('sjl/gundo.vim')
  
  call minpac#add('davidhalter/jedi-vim')
  
  if has('cscope')
    call minpac#add('vim-scripts/autoload_cscope.vim')
  endif
  call minpac#add('Chiel92/vim-autoformat')
  
  " only used for plaintext files
  call minpac#add('reedes/vim-lexical')
  call minpac#add('reedes/vim-wordy')
  
  call minpac#add('farseer90718/vim-taskwarrior')
  call minpac#add('vim-scripts/scratch.vim')
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('tpope/tpope-vim-abolish')

  "call minpac#add('phleet/vim-mercenary')
  call minpac#add('ludovicchabant/vim-lawrencium')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-eunuch')
  " Lua repl
  call minpac#add('ujihisa/repl.vim')

  " Rust support
  call minpac#add('rust-lang/rust.vim')

"endif

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
" (note that ALL of your vimrc files MUST be reloadable)
"command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
"command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
source ~/.vim/packages_config.vim
