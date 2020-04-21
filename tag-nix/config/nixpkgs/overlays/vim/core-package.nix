pkgs:

with (pkgs.vimPlugins) // (pkgs.vimPrivatePlugins); {
  start = [
    commentary
    fugitive
    fzf-vim
    fzfWrapper #?
    LanguageClient-neovim
    repeat
    sleuth
    supertab
    surround
    undotree
    vim-abolish
    vim-colors-solarized
    vim-dispatch
    vim-eunuch
    vim-grepper
    vim-pencil
    vim-snippets
    vim-unimpaired
    vimwiki
    vim-wordy
    vinegar
    zenburn
    rooter #-git-2020-02-17
    scratch #-git-2010-10-17
    apathy #-git-2019-11-12
    endwise #-git-2019-11-12
    jdaddy #-git-2019-11-12
    lexical #-git-2020-01-07
  ];

  opt = [
    ale
    direnv-vim
    emmet-vim
    rainbow_parentheses
    #sexp-mappings-for-regular-people #-git-2020-01-16
    #sexp #-git-2017-05-15
    # available
    # syntastic
    # ultisnips
    # youcompleteme
    # vim-fireplace
    # vim-beancount
    # vim-lawrencium
    # vim-ledger
    # vim-nix
    # vim-parinfer
    # vim-projectionist
    # vim-textobj-*
  ];
}
