#!/usr/bin/env zsh

#set -o pipefail
#set -o nounset
#set -o errexit

## Oh My Zsh automatically checks for upgrades itself :)

if [[ "$(uname)" == "Linux" ]]; then
  sudo apt install -y zsh
fi

### Install Oh My Zsh
if ! which zsh; then
  sudo -S sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sudo chown -R $(whoami):admin $HOME/.oh-my-zsh
fi

# tldr, a "man page" replacement
sudo npm i -g tldr

sudo mkdir -p ~/zsh_theme/themes
sudo ln -s -f $DOTFILES/zsh/ingshtrom.zsh-theme ~/.oh-my-zsh/custom/themes/ingshtrom.zsh-theme

# need a dir to store todo-txt details
if [[ ! -d "$HOME/.config/todo-txt" ]];
then
  mkdir $HOME/.config/todo-txt
fi

# Use gnu utils instead of os x
if [[ "$(uname)" == "Darwin" ]]; then
  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

  for utility in coreutils ed findutils gawk gnu-indent gnu-sed gnu-tar gnu-which grep make; do
    if [[ -d /usr/local/opt/${utility}/libexec/gnubin ]]; then
      MANPATH="/usr/local/opt/${utility}/libexec/gnuman:$MANPATH"
      PATH="/usr/local/opt/${utility}/libexec/gnubin:$PATH"
    fi
  done
fi

# bat
mkdir -p "$HOME/.config/bat"
touch "$HOME/.config/bat/config"

sudo ln -s -f "$DOTFILES/zsh/bat-config.$(uname)" "$HOME/.config/bat/config"

ZSH=$HOME/.oh-my-zsh sh $ZSH/tools/upgrade.sh

source ~/.dotfiles/zsh/zshrc.symlink

omz update

zplug install
zplug update
zplug clean
zplug status

