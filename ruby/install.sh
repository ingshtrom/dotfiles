#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

version=2.7.1

eval "$(rbenv init -)"
RUBY_CFLAGS="-Wno-error=implicit-function-declaration" rbenv install -s "$version"
rbenv global "$version"
gem install bundler
gem install lolcat
gem install cowsay
