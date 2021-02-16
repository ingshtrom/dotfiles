#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

if test ! -d ~/.config/kitty
then
	sudo mkdir -p ~/.config/kitty
fi
if test ! -f ~/.config/kitty/kitty.conf
then
	ln -s $DOTFILES/kitty/kitty.conf ~/.config/kitty/kitty.conf
fi
