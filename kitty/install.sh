#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

source $DOTFILES_ROOT/script/linker_source


link_file $DOTFILES_ROOT/kitty/kitty.conf ~/.config/kitty/kitty.conf
link_file $DOTFILES_ROOT/kitty/dracula.conf ~/.config/kitty/dracula.conf
link_file $DOTFILES_ROOT/kitty/diff.conf ~/.config/kitty/diff.conf

