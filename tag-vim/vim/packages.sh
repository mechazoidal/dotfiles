#!/usr/bin/env sh
# Provided to bootstrap a new os/vim installation
target="$HOME/.vim/pack/$USER"
if [[ ! ( -e $target && -d $target ) ]]
then
  mkdir -p $target
fi

start="
https://github.com/vim-scripts/ag.vim
https://github.com/mattn/emmet-vim
https://github.com/Shougo/neomru.vim
https://github.com/scrooloose/nerdcommenter
https://github.com/rust-lang/rust.vim
https://github.com/vim-scripts/scratch.vim
https://github.com/tpope/tpope-vim-abolish
https://github.com/osyo-manga/unite-quickfix
https://github.com/Shougo/unite.vim
https://github.com/osyo-manga/vim-anzu
https://github.com/ConradIrwin/vim-bracketed-paste
https://github.com/tpope/vim-dispatch
https://github.com/tpope/vim-endwise
https://github.com/tpope/vim-eunuch
https://github.com/tpope/vim-fugitive
https://github.com/mhinz/vim-grepper
https://github.com/tpope/vim-repeat
https://github.com/airblade/vim-rooter
https://github.com/guns/vim-sexp
https://github.com/tpope/vim-sexp-mappings-for-regular-people
https://github.com/tpope/vim-surround
https://github.com/tpope/vim-unimpaired
https://github.com/Shougo/vimproc.vim
https://github.com/vimwiki/vimwiki
https://github.com/mbbill/undotree
"

opt="
https://github.com/vim-scripts/autoload_cscope.vim
https://github.com/davidhalter/jedi-vim
https://github.com/ludovicchabant/vim-lawrencium
https://github.com/reedes/vim-lexical
https://github.com/reedes/vim-wordy
https://github.com/reedes/vim-pencil
https://github.com/farseer90718/vim-taskwarrior
https://github.com/kien/rainbow_parentheses.vim
https://github.com/sjl/gundo.vim
"

for package_repo in $start
do
  start_target="$target/start"
  if [[ ! ( -e "$start_target" && -d "$start_target" ) ]]
  then
    mkdir -p "$start_target"
  fi
  package=$(basename "$package_repo")
  if [[ ! ( -e "$start_target/$package" && -d "$start_target/$package" ) ]]
  then
    echo "$package_repo.git"
    cd "$start_target" && git clone "$package_repo.git"
  fi
done

for package_repo in $opt
do
  opt_target="$target/opt"
  if [[ ! ( -e "$opt_target" && -d "$opt_target" ) ]]
  then
    mkdir -p "$opt_target"
  fi
  package=$(basename "$package_repo")
  if [[ ! ( -e "$opt_target/$package" && -d "$opt_target/$package" ) ]]
  then
    cd "$opt_target" && git clone "$package_repo.git"
  fi
done
