#!/usr/local/bin/zsh
################################################################################################
# Git
# Use `hub` as our git wrapper: https://github.com/github/hub
hub_path=$(which hub)
if (( $+commands[hub] ))
then
 alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git log'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# Remove `+` and `-` from start of diff lines; just rely upon color.
#alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
alias gd='git diff'
alias gc='git checkout'
alias gb='git branch --sort=-committerdate'
alias gcom='git add -A && git commit -s'
alias gac='git add -A && git commit -s'
# alias gps='docker run --rm --name=gitleaks -v $(git rev-parse --show-toplevel):/tmp zricethezav/gitleaks -v --repo-path=/tmp && git push'
alias gps='git push'
alias gp='git pull'
alias gs='git status'
alias ga='git add --all'
alias gl='docker run --rm --name=gitleaks -v $(git rev-parse --show-toplevel):/tmp zricethezav/gitleaks -v --repo-path=/tmp'
alias gg='cd $(git rev-parse --show-toplevel)'
