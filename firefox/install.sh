#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

prev_dir=$(pwd)

# get that SWEET theme for Firefox
#if [[ ! -d "$HOME/src/firefox-sweet-theme" ]]
#then
#  git -C "$HOME/src" clone https://github.com/EliverLara/firefox-sweet-theme
#fi

#cd "$HOME/src/firefox-sweet-theme"
#git up
#sudo ./scripts/install.sh
#cd "$prev_dir"
