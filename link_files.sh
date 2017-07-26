#!/usr/bin/env bash
set -eu

local_path_file=$(stat -f "%N" "$0")
local_path=${local_path_file%/*}

dotfiles_path="/managed/"

for i in $(ls -A "${local_path}${dotfiles_path}");
do
  if [[ -a $i ]]; then
    echo "Error: found file ${i}. Will not replace."
  else
    echo linking file $i
    ln -s ${local_path}${dotfiles_path}${i} ~/${i}
  fi
done
