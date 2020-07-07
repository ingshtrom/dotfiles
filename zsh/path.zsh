################################################################################################
# Go Lang
export GOPATH=$PROJECTS/go
export PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"


################################################################################################
# Node.js
# Would normally be added by n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

################################################################################################
# Visual Studio Code
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


################################################################################################
# GNU Utils
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"


################################################################################################
# YARN
# https://yarnpkg.com

# if [[ $+commands[yarn] ]]; then
#   export PATH="$PATH:$(yarn global bin)"
# fi

# up to date Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# unix curl
# NOTE: commented out because OSX Curl includes many more features now (HTTP2)
# export PATH="/usr/local/opt/curl/bin:$PATH"

# Python3 is the default now
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# ZSH function fpath for loading auto-completion
fpath=(/usr/local/share/zsh-completions $fpath)

# Homebrew for linux/mac
export PATH="$PATH:$(brew --prefix)/bin"

# Buildkit standalone binaries
export PATH="$PATH:/usr/local/buildkit/bin"


################################################################################################
# System
export PATH="./bin:/usr/local/bin:/usr/local/sbin:$DOTFILES/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
export EDITOR='nvim'
export VISUAL='nvim'

# create misc bin for personal usage
# that overwrites all other binaries
mkdir -p "$HOME/.bin"
export PATH="$HOME/.bin:$PATH"
