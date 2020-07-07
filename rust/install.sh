#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

if ! which rustup
then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if [[ "$(uname)" == "Linux" ]]
then
  $HOME/.cargo/bin/cargo install ripgrep jwt-cli
fi

$HOME/.cargo/bin/cargo update
