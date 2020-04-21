pkgs:

{

  rooter = pkgs.vimUtils.buildVimPlugin {
    name = "rooter-git-2020-02-17";
    src = pkgs.fetchgit {
      url = "https://github.com/airblade/vim-rooter.git";
      rev = "8a0a201a17fae3f7656b99f74d67741986faba37";
      sha256 = "1r8kzzljs39ycc6jjh5anpl2gw73c2wb1bs8hjv6xnw1scln6gwq";
     };
    meta = {
      homepage = https://github.com/airblade/vim-rooter; 
    };
  };

  scratch = pkgs.vimUtils.buildVimPlugin {
    name = "scratch-git-2010-10-17";
    src = pkgs.fetchgit {
      url = "https://github.com/vim-scripts/scratch.vim.git";
      rev = "90c2bc4bfe01151aa5c71d9cb243b05bc105ae01";
      sha256 = "1wxks5s5z0r4imj6wq3bqgc0rhw39jg2x2wqfmlij31gknppd93k";
     };
    meta = {
      homepage = https://github.com/vim-scripts/scratch.vim; 
    };
  };

  apathy = pkgs.vimUtils.buildVimPlugin {
    name = "apathy-git-2019-11-12";
    src = pkgs.fetchgit {
      url = "https://github.com/tpope/vim-apathy.git";
      rev = "ca90185a497088bbb62d933bb500cb2911c7be64";
      sha256 = "1hbp19s29lkbzq30dn19adcp2348jmg7wcv1n2j3m19zxsifh6jw";
     };
    meta = {
      homepage = https://github.com/tpope/vim-apathy; 
    };
  };

  endwise = pkgs.vimUtils.buildVimPlugin {
    name = "endwise-git-2019-11-12";
    src = pkgs.fetchgit {
      url = "https://github.com/tpope/vim-endwise.git";
      rev = "bf90d8be447de667f4532b934d1a70881be56dd8";
      sha256 = "1czx891via5783yk222mhki94wvq75hxxp1xk1d5m90vwqb3azfn";
     };
    meta = {
      homepage = https://github.com/tpope/vim-endwise; 
    };
  };

  jdaddy = pkgs.vimUtils.buildVimPlugin {
    name = "jdaddy-git-2019-11-12";
    src = pkgs.fetchgit {
      url = "https://github.com/tpope/vim-jdaddy.git";
      rev = "5cffddb8e644d3a3d0c0ee6a7abf5b713e3c4f97";
      sha256 = "1vzay1f9x3m971ivnd9lfiwmyli8gblzgnw21cs6y20d99xgn670";
     };
    meta = {
      homepage = https://github.com/tpope/vim-jdaddy; 
    };
  };

  lexical = pkgs.vimUtils.buildVimPlugin {
    name = "lexical-git-2020-01-07";
    src = pkgs.fetchgit {
      url = "https://github.com/reedes/vim-lexical.git";
      rev = "0898c0cfcd1236f98c339380b99a135eca5a0544";
      sha256 = "0ashcjh0y0kjg0njsbgk51jmrlxmdmlagac7wf75k05j3hshw978";
     };
    meta = {
      homepage = https://github.com/reedes/vim-lexical; 
    };
  };

  sexp-mappings-for-regular-people = pkgs.vimUtils.buildVimPlugin {
    name = "sexp-mappings-for-regular-people-git-2020-01-16";
    src = pkgs.fetchgit {
      url = "https://github.com/tpope/vim-sexp-mappings-for-regular-people.git";
      rev = "7c3de2f13422fb4b62b4c34a660532c7b3d240c7";
      sha256 = "0malswal9hnbq2wf1rx2lp1r69wpwsvyhgi46xbg079x2n857bmj";
     };
    meta = {
      homepage = https://github.com/tpope/vim-sexp-mappings-for-regular-people; 
    };
  };

  sexp = pkgs.vimUtils.buildVimPlugin {
    name = "sexp-git-2017-05-15";
    src = pkgs.fetchgit {
      url = "https://github.com/guns/vim-sexp.git";
      rev = "12292941903d9ac8151513189d2007e1ccfc95f0";
      sha256 = "1mfqbmrbqgnsc34pmcsrc0c5zvgxhhnw4hx4g5wbssfk1ddyx6y0";
     };
    meta = {
      homepage = https://github.com/guns/vim-sexp; 
    };
  };
}
