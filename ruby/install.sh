#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

version=2.7.1

eval "$(rbenv init -)"
rbenv install "$version" # latest version as of this writing
rbenv global "$version"
gem install bundler
gem install lolcat
gem install cowsay
