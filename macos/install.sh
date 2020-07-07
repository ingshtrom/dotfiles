#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

os=$(uname)
if [[ "$os" == "Darwin" ]]; then
  echo "› sudo softwareupdate -i -a"
  sudo -S softwareupdate -i -a # --restart
fi
