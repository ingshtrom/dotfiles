#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

if [[ "$(uname)" == "Linux" ]]; then
  sudo apt install -y nodejs npm
fi

npm i -g npm
