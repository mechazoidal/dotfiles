# Overlay that provides custom vim+plugin setups
self: super:

# { stdenv
# , fetchFromGitHub
# }:

#stdenv.mkDerivation {
#  name = "dotvim";

#  src = fetchFromGitHub {
#    owner = "mechazoidal";
#    repo = "dotfiles";
#    rev = "d9495d76573523cdcaf11bc5c9e82d810f96fead";
#    sha256 =  "1ca914122fbfa800b9857a5881043ce32acd9dbf13cb00bbd1cf5545a9699ab0";
#  };

#  phases = [
#    "unpackPhase"
#    "installPhase"
#  ];

#  installPhase = ''
#    mkdir -p $out
#    cp $src/tag-vim/vimrc $out/vimrc
#    cp $src/tag-vim/vim/plugin/config.vim $out/.vim/plugin/config.vim
#  '';
#    #cat $src/tag-vim/vimrc $src/tag-vim/vim/plugin/config.vim > $out/vimrc

#  meta = {
#    description = "my custom vim config.";
#  };
#}

let
  configured = {
    packages.core = (import ./core-package.nix) self;
    customRC = ''
      " opt into Vim 8’s new defaults
      " see `:help defaults.vim`
      unlet! skip_defaults_vim
      if filereadable($VIMRUNTIME . '/defaults.vim')
        source $VIMRUNTIME/defaults.vim
      endif
      
      " syntax highlighting, keep existing color settings
      syntax enable 
      
      " Nobody really needs modelines, especially with security issue
      set modelines=0
      
      " Don't fiddle with tabstop, just customize shiftwidth/softtabs
      set shiftwidth=2
      set softtabstop=2
      set expandtab
      
      " Sanity settings
      set encoding=utf-8
      set scrolloff=3
      set autoindent
      set showmode
      set hidden
      set wildmode=longest:full,full
      set visualbell
      set ttyfast
      set backspace=indent,eol,start
      set laststatus=2
      
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
      " TODO not sure if these are useful, and if they're causing slowdown
      "nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : \'\') . \'j\' : \'gj\'
      "nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : \'\') . \'k\' : \'gk\'
      
      " Allow 'gq', automatically insert comment leader in Insert, recognize list numbers
      set formatoptions=qrn1
      "set colorcolumn=100 " visual warning if longer than 100 chars in line
      
      " optimization: only syntax highlight the first 200 characters of each line
      set synmaxcol=200
      
      " Show invisible characters(tab, EOL)
      set list
      set listchars=tab:▸\ ,eol:¬
      
      " Don't warn about files changing out from under us
      set autoread
      
      " Default spelling is US English
      set spelllang=en_us
      
      " Key mappings
      let mapleader = "\<Space>"
      
      " Change default regex to use \v
      nnoremap / /\v
      vnoremap / /\v
      
      " Clear out search results
      nnoremap <leader>, :noh<cr>
      
      " Make ; do the same thing as :
      nnoremap ; :
      
      " change all smart quotes to their ascii equivs(", ')
      " (does not use /g since 'gdefault' is now always on)
      "FIXME
      nnoremap <leader>Q :%s/\%u201c/"/<cr>:%s/\%u201d/"/<cr>:%s/\%u2019/'/<cr>:%s/\%u2018/'/<cr>:let @/=\'\'<CR>
      " strip all trailing whitespace in the current file
      nnoremap <leader>W :%s/\s\+$//<cr>:let @/=\'\'<CR>
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
      
      " Allow '~' to be used as an operator
      set tildeop
      
      " Default augroup for autocmds defined in vimrc
      augroup vimrc
        autocmd!
      augroup end
      
      " force detection of *.md to Markdown, not modula-2
      autocmd vimrc BufNewFile,BufReadPost *.md set filetype=markdown
      
      " fold tags with ,ft
      "nnoremap <leader>ft Vatzf
      
      " Reselect just-pasted text with ,v
      "nnoremap <leader>v V`]
      
      
      " Autosave on losing focus
      autocmd vimrc FocusLost * :wa
      
      " SWP files and friends
      " Write undo/swap files to a vim-specific temp dir
      set backupdir=$HOME/.vtemp//
      set directory=~/.vtemp//,/tmp
      set undodir=~/.vtemp//
      set viminfo+=n~/.vtemp/viminfo
      " Skip /tmp and /private since changing anything there needs edit-in-place
      set backupskip=/tmp/*,/private/tmp/*
      " Automatically recover+delete swap files if reopening after a crash
      augroup vimrc AutomaticSwapRecoveryAndDelete
          autocmd SwapExists * :let v:swapchoice = 'r' | let b:swapname = v:swapname
          autocmd BufWinEnter * :if exists("b:swapname") | call delete(b:swapname) | unlet b:swapname | endif
      augroup end
      
      " automatically equalize splits on resize
      autocmd vimrc VimResized * wincmd =
      
      
      " kill buffer without closing split
      "command Bd bp\|bd \#
      
      " TRIAL
      " from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
      " THis is a slightly smarter tab-complete. It moves backwards in the menu to
      " avoid trickery with sending C-N after a Tab
      function! InsertTabWrapper()
          let col = col('.') - 1
          if !col || getline('.')[col - 1] !~ '\k'
              return "\<Tab>"
          else
              return "\<C-P>"
          endif
      endfunction
      inoremap <expr> <Tab> InsertTabWrapper()
      inoremap <S-Tab> <C-N>
      
      
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
      
      "FIXME
      "packadd! vim-lexical
      " Can't define these in after/ftplugin as they are plugin-specific
      "augroup lexical
      "  autocmd!
      "  autocmd FileType markdown,mkd call lexical#init()
      "  autocmd FileType textile call lexical#init()
      "  autocmd FileType text call lexical#init({ 'spell': 0 })
      "  autocmd FileType vimwiki call lexical#init({ 'spell': 0 })
      "augroup END
      
      
      " TODO move+load developer.vim to/from plugin/
      
      " courtesy of steve losh
      nnoremap <leader>ev :vsplit $MYVIMRC<cr>
      nnoremap <leader>sv :source $MYVIMRC<cr>
      
      " Enable matchit plugin for better '%' usage
      " (it is supplied with vim as of 8+: $VIMRUNTIME/pack/dist/opt/matchit)
      packadd! matchit
      
      " Ruby (and others?) don't play nice with the newer regex engine
      " TODO it'd be nice to have this on a per-language or per-file basis,
      " but I don't think you can!
      "set regexpengine=1
      
      
      " Make Y apply from cursor to end of line
      nnoremap Y y$
      
      "nnoremap <leader>iw :put =strftime('%U')<cr>
      "nnoremap <leader>id :put =strftime('%A')<cr>
      nnoremap <leader>id :put =strftime('%Y%m%d')<cr>
      set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
      "map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectory
      let g:rooter_use_lcd = 1
      let g:rooter_silent_chdir = 1
      "runtime plugin/grepper.vim
      "let g:grepper.rg.grepprg .= ' --smart-case'
      nnoremap <leader>a :Grepper -tool ag<cr>
      nnoremap <leader>r :Grepper -tool rg<cr>
      " Enables using "gs" as an operator to populate the search prompt
      " (eg. 'gsiw' to search for the word under cursor)
      nmap gs  <plug>(GrepperOperator)
      xmap gs  <plug>(GrepperOperator)
      
      nnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
      vnoremap <silent> <leader>m :VimwikiToggleListItem<CR>
      let g:vimwiki_use_calendar = 1
      let g:vimwiki_url_maxsave = 0
      "let g:vimwiki_conceallevel = 2
      let diary_wiki = {}
      let diary_wiki.path = '~/personalwiki'
      let diary_wiki.auto_tags = 1
      let notes_wiki = {}
      let notes_wiki.path = '~/notewiki'
      let notes_wiki.auto_tags = 1
      " let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_tags': 1}]
      let g:vimwiki_list = [diary_wiki, notes_wiki]
      let g:vimwiki_table_mappings = 0
      
      
      nnoremap <Leader>f :Files 
      nnoremap <Leader>g :GFiles<cr>
      nnoremap <Leader>e :History<cr>
      nnoremap <leader>` :Buffers<CR>
      let g:fzf_layout = { 'down': '~15%' }
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
      
      nnoremap <leader>U :UndotreeToggle<CR>
      if has("persistent_undo")
        set undodir=~/.undodir/
        set undofile
      endif
      " TODO it would be nice to have completion-chaining, but it seems like it
      " always ignores it when used with LanguageClient!
      let g:SuperTabSetDefaultCompletionType = "context"

      let g:ulti_expand_or_jump_res = 0 "default value, just set once
      let g:UltiSnipsExpandTrigger = '<C-j>'
      let g:UltiSnipsJumpForwardTrigger = '<C-j>'
      let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
      '';
    };

in

{
  vimPrivatePlugins = (import ./plugins.nix) super;

  mecha_vim = self.vim_configurable.customize {
    # vim binary name:
    # enables multiple vim packages with different plugins
    # (possibly use this mechanism for writing, dev, etc)
    name = "vim-with-plugins";
    # using vim builtin packaging
    vimrcConfig = configured;
  };
}
