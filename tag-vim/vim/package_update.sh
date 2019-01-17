#!/usr/bin/env sh
target="$HOME/.vim/pack/$USER"

#. "$HOME/.vim/package_list.sh"
PACKAGE=${1:?package is required}

#echo "$start"

#for package_repo in $start
#do
  #start_target="$target/start"
#done

start_target="$target/start/$PACKAGE"
cmd=$(cd $start_target; git fetch -q && git merge --ff-only -q)
echo $cmd
