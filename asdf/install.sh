#!/usr/bin/env zsh

if [[ ! -d ~/.asdf ]]; then
  # TODO: this needs updating from time to time
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi

asdf update
