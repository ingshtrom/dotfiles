#!/usr/bin/env bash

# cannot do pipefail because the `pyenv virtualenv ...` 
# commands will fail on subsequent runs
set -o pipefail
set -o nounset
set -o errexit

#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#eval "$(direnv hook $SHELL)"

python_2_version="2.7.17"
python_3_version="3.9.1"

pyenv install "${python_2_version}" --skip-existing
pyenv install "${python_3_version}" --skip-existing


if ! (pyenv virtualenvs | grep general2)
then
  pyenv virtualenv "$python_2_version" general2
fi
pyenv activate general2
pip install --upgrade wheel pip


if ! (pyenv virtualenvs | grep general3)
then
pyenv virtualenv "$python_3_version" general3
fi
pyenv activate general3
pip install --upgrade wheel pip


if ! (pyenv virtualenvs | grep neovim2)
then
pyenv virtualenv "$python_2_version" neovim2
fi
pyenv activate neovim2
pip install --upgrade wheel neovim pip

if ! (pyenv virtualenvs | grep neovim3)
then
pyenv virtualenv "$python_3_version" neovim3
fi
pyenv activate neovim3
pip install --upgrade wheel neovim pip flake8

ln -f -s `pyenv which flake8` ~/.bin/flake8

