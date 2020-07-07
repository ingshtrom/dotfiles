#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

echo 'n/a'

#if [[ "$(uname)" == "Linux" ]]; then
#  sudo apt install -y kitty kitty-doc kitty-terminfo

#  # NOTE: latest version didn't work, so likely keeping 
#  # an older version or using alacritty
#  #dest=/usr/local/bin/kitty
#  #tmp_dir=$(mktemp -d)
#  #tar_file="${tmp_dir}/kitty.txz"
#  #curl -sSL -H "$GITHUB_AUTHORIZATION_HEADER" $(curl -s -H "$GITHUB_AUTHORIZATION_HEADER" https://api.github.com/repos/kovidgoyal/kitty/releases | jq -r '.[0].assets | map(select(.label | contains("Linux amd64"))) | .[0].browser_download_url') -o "$tar_file"
#  #sudo tar -xvf $tar_file -C $tmp_dir
#  #sudo mv "${tmp_dir}/bin/kitty" $dest
#  #sudo rm -rf $tmp_dir
#  #sudo chmod +x $dest
#fi

#if test ! -d ~/.config/kitty
#then
#  sudo mkdir -p ~/.config/kitty
#fi
#if test ! -f ~/.config/kitty/kitty.conf
#then
#  sudo ln -s $DOTFILES/kitty/kitty.conf ~/.config/kitty/kitty.conf
#fi
