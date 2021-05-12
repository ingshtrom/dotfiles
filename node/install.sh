#!/usr/bin/env zsh

#set -o nounset
#set -o errexit
#set -o pipefail

if [[ "$(uname)" == "Linux" ]]; then
  sudo apt install -y nodejs npm
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install --lts
nvm use --lts
npm i -g npm
