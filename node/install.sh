#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

if [[ "$(uname)" == "Darwin" ]]; then
  n lts
fi
if [[ "$(uname)" == "Linux" ]]; then
  sudo apt install -y nodejs npm
fi

npm i -g npm
