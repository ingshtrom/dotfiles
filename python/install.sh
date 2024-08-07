#!/usr/bin/env bash

asdf plugin-add python
asdf install python latest
asdf global python latest

# python3 -m pip install --upgrade pip

mkdir -p ~/.config/pycodestyle
mkdir -p ~/.config/flake8
ln -s -f ~/.dotfiles/python/pycodestyle.cfg ~/.config/pycodestyle/pycodestyle.cfg
ln -s -f ~/.dotfiles/python/flake8.cfg ~/.config/flake8/flake8.cfg

python3 -m pip install --upgrade pip
