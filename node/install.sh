#!/usr/bin/env zsh

set -o nounset
set -o errexit
set -o pipefail

if [[ "$(uname)" == "Linux" ]]; then
  sudo apt install -y nodejs npm
fi

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

npm i -g npm
