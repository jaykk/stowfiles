#!/usr/bin/env bash
set -eu

local_path_file=$(find "$0")
local_path=${local_path_file%/*}

dotfiles_path="/managed/"
dot_config_path="/managed_config/"

for i in $(ls -A "${local_path}${dotfiles_path}");
do
  if [ -e $HOME/${i} ]
  then
    echo "Found file ${i}. Will not replace."
  else
    if [ -h $HOME/${i} ]
    then
      unlink $HOME/${i}
    fi
    echo linking file $i
    ln -s ${local_path}${dotfiles_path}${i} ~/${i}
  fi
done
for i in $(ls -A "${local_path}${dot_config_path}");
do
  if [[ -e ~/.config/$i ]] ; then
    echo "Found file ${i}. Will not replace."
  else
    echo linking file $i
    ln -s ${local_path}${dotfiles_path}${i} ~/.config/${i}
  fi
done
