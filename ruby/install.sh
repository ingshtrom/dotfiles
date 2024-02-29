#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest

gem install bundler
gem install lolcat
gem install cowsay
