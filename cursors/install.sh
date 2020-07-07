#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

# make sure we have updated dependencies
if [[ "$(uname)" == "Linux" ]]; then
  if [[ ( ! -d /usr/share/icons/oreo_blue_cursors ) || \
    ( ! -d /usr/share/icons/oreo_purple_cursors ) || \
    ( ! -d /usr/share/icons/oreo_pink_cursors ) || \
    ( ! -d /usr/share/icons/oreo_teal_cursors ) || \
    ( ! -d /usr/share/icons/oreo_grey_cursors ) ]]
  then
    sudo apt install -y git make inkscape
    cur_dir=$(pwd)
    cd $DOTFILES/cursors/oreo-cursors
    make build
    sudo make install
    cd $cur_dir
  fi
fi
