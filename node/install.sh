#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

if [[ "$(uname)" == "Darwin" ]]; then
  brew install node
  n lts
  npm i -g npm
fi
if [[ "$(uname)" == "Linux" ]]; then
  sudo apt install -y nodejs npm
  sudo npm i -g npm
fi
