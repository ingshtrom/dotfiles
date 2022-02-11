#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

source $DOTFILES_ROOT/script/linker_source

link_file $DOTFILES_ROOT/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

