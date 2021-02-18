#!/usr/bin/env zsh

set -o pipefail
set -o nounset
set -o errexit

os=$(uname)
if [[ "$os" == "Darwin" ]]; then
  if hash xbuild 2>/dev/null; then
    echo 'cool, xbuild is installed'
  else
    echo 'You need to install xbuild to continue with the installation progress.'
    echo 'http://www.mono-project.com/download/stable/'
    exit 1
  fi

  # bunch of library installations to make sure everything is working smoothly
  # honestly, I'm not sure what all of them do anymore
  pip install neovim

  # NOTE: this is optional in :checkhealth
  # gem install neovim

  n lts
  npm i -g neovim
  npm i -g typescript
else
  # install neovim
  tar_file="/tmp/nvim-linux64.tar.gz"
  curl -sSL -H "$GITHUB_AUTHORIZATION_HEADER" $(curl -s -H "$GITHUB_AUTHORIZATION_HEADER" https://api.github.com/repos/neovim/neovim/releases | jq -r '.[0].assets | map(select(.name | contains("nvim-linux64.tar.gz"))) | .[0].browser_download_url') -o "$tar_file"
  sudo tar zxvf "$tar_file" -C /tmp/
  sudo rm "$tar_file"

  # bunch of library installations to make sure everything is working smoothly
  # honestly, I'm not sure what all of them do anymore
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  eval "$(direnv hook $SHELL)"
  pyenv activate neovim2
  pip install neovim pynvim

  pyenv activate neovim3
  pip install neovim pynvim

  sudo npm i -g neovim typescript
fi

mkdir -p ~/.config/nvim/config/
ln -s -f ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s -f ~/.dotfiles/nvim/config/* ~/.config/nvim/config/

if test -f ~/.config/nvim/.did-run-install-cmds
then
  nvim +PlugInstall +PlugUpdate +GoUpdateBinaries +qall --headless
else
  nvim +PlugInstall +PlugUpdate +GoInstallBinaries +qall --headless
  touch ~/.config/nvim/.did-run-install-cmds
fi
