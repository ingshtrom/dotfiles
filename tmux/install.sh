#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit


if [[ ! -d ~/.tmux/plugins ]]
then
  mkdir -p ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

git -C ~/.tmux/plugins/tpm reset --hard
# git -C ~/.tmux/plugins/tpm pull --force
# # ~/.tmux/plugins/tpm/bin/clean_plugins
# ~/.tmux/plugins/tpm/bin/install_plugins
# ~/.tmux/plugins/tpm/bin/update_plugins all
