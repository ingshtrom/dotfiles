#!/usr/bin/env bash

# cannot do pipefail because the `pyenv virtualenv ...` 
# commands will fail on subsequent runs
#set -o pipefail
#set -o nounset
#set -o errexit

#source "$DOTFILES/python/script_source.sh"

#python_2_version="2.7.17"
#python_3_version="3.8.3"

#pyenv install $python_2_version --skip-existing
#pyenv install $python_3_version --skip-existing

#pyenv virtualenv $python_2_version general2 || true
#pyenv activate general2
#pip install --upgrade wheel pip

#pyenv virtualenv $python_3_version general3 || true
#pyenv activate general3
#pip install --upgrade wheel pip

#pyenv virtualenv 2.7.17 neovim2 || true
#pyenv activate neovim2
#pip install --upgrade wheel neovim pip

#pyenv virtualenv 3.8.3 neovim3 || true
#pyenv activate neovim3
#pip install --upgrade wheel neovim pip flake8

#ln -f -s `pyenv which flake8` ~/.bin/flake8

