#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

if [[ "$(uname)" == "Linux" ]]
then
  # so that we have gcc-5, even though I
  # can't find where to install the actuall binary
  sudo ln -f -s /usr/bin/gcc /usr/bin/gcc-5
fi

curl -sf https://gobinaries.com/rakyll/hey | sh
#curl -sf https://gobinaries.com/cloudflare/cfssl/cmd/cfssl | sh
