#!/opt/homebrew/bin/zsh

#set -o pipefail
#set -o nounset
#set -o errexit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

os=$(uname)
if [[ "$os" == "Darwin" ]]; then
  #if hash xbuild 2>/dev/null; then
  #  echo 'cool, xbuild is installed'
  #else
  #  echo 'You need to install xbuild to continue with the installation progress.'
  #  echo 'http://www.mono-project.com/download/stable/'
  #  exit 1
  #fi

  python3 -m pip install neovim pynvim 'python-lsp-server[all]'

  nvm install --lts
  nvm use --lts
  npm i --save -g neovim \
    tree-sitter-cli \
    typescript \
    typescript-language-server \
    vscode-json-languageserver \
    vim-language-server \
    yaml-language-server \
    bash-language-server \
    dockerfile-language-server-nodejs \
    vscode-langservers-extracted
else
  # install neovim
  tar_file="/tmp/nvim-linux64.tar.gz"
  curl -sSL -H "$GITHUB_AUTHORIZATION_HEADER" $(curl -s -H "$GITHUB_AUTHORIZATION_HEADER" https://api.github.com/repos/neovim/neovim/releases | jq -r '.[0].assets | map(select(.name | contains("nvim-linux64.tar.gz"))) | .[0].browser_download_url') -o "$tar_file"
  sudo tar zxvf "$tar_file" -C /tmp/
  sudo rm "$tar_file"

  python3 -m pip install neovim pynvim 'python-lsp-server[all]'

  sudo npm i -g neovim typescript typescript-language-server vscode-json-languageserver vim-language-server yaml-language-server bash-language-server dockerfile-language-server-nodejs vscode-langservers-extracted
fi

# NOTE: old stuff prior to AstroNvim {
#mkdir -p ~/.config/nvim/config/
#ln -s -f ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
#ln -s -f ~/.dotfiles/nvim/config/* ~/.config/nvim/config/
# }

# NOTE: AstroNvim {
if ! test -d ~/.config/nvim;
then
  git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
fi
# copy over the AstroNvim init.lua user modification script
mkdir -p ~/.config/nvim/lua/user
ln -s -f ~/.dotfiles/nvim/astro-nvim-user/init.lua ~/.config/nvim/lua/user/init.lua
nvim --headless "+Lazy! sync" +qa
# }


#if test -f ~/.config/nvim/.did-run-install-cmds
#then
#  nvim +PlugInstall +PlugUpdate +TSUpdateSync +qall --headless
#else
#  nvim +PlugInstall +PlugUpdate +TSUpdateSync +qall --headless
#  touch ~/.config/nvim/.did-run-install-cmds
#fi

# keep the LSP log file cleaned up
if ls /Users/alexhokanson/.cache/nvim/lsp.log 2>&1 > /dev/null;
then
  rm /Users/alexhokanson/.cache/nvim/lsp.log
fi
