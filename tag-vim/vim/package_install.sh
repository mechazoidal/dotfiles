#!/usr/bin/env sh
# Provided to bootstrap a new os/vim installation
target="$HOME/.vim/pack/$USER"

# FIXME ksh-specific for now
. "$HOME/.vim/package_list.sh"

if [[ ! ( -e $target && -d $target ) ]]
then
  mkdir -p $target
fi

# FIXME don't try to create dirs/repos if they already exist, just warn
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

#command! -nargs=0 -bar Helptags for p in glob('~/.vim/pack/mecha/opt/*', 1, 1) | exe 'packadd '.fnamemodify(p, ':t') | endfor | helptags ALL
#curl https://raw.githubusercontent.com/words/moby/master/words.txt --create-dirs -o ~/.vim/thesaurus/mthesaur.txt 
