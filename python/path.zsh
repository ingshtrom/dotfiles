# to support pyenv, virtualenv, and direnv all working together :)
export PYENV_ROOT="$HOME/.dotfiles/python/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook $SHELL)"
