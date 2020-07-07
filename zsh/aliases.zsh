#!/usr/local/bin/zsh

if [[ "$(uname)" == "Linux" ]]; then
  alias ls="ls --color"
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
else
  alias ls="ls -FG"
fi


################################################################################################
# Misc
alias cls="clear && printf '\e[3J'" # clear screen AND history. BOOM!
alias ti='terraform init'
alias ta='terraform apply'
alias to='terraform output'
alias tg='terraform graph'
alias ts='terraform show'
alias tp='terraform plan'
alias cur='aws iam list-account-aliases | jq ".AccountAliases[0]"'

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias saa="ssh-add $HOME/.ssh/dckr-default && ssh-add $HOME/.ssh/dckr-infra && ssh-add $HOME/.ssh/dckr-swarm && ssh-add $HOME/.ssh/dckr-nautilus"

alias d="docker"
alias kc="kubectx"
alias kn="kubens"

alias sslyze="docker run --rm -it nablac0d3/sslyze"

alias curl_gnu="/usr/local/opt/curl/bin/curl"

#alias t="tmux"
alias todo="$(brew --prefix)/bin/todo.sh -ANtc"
alias t="task"

#alias diff="colordiff"
alias dir_diff="diff -r -x .git -x .terraform -N"

alias yk_code="ykman oath code $1"
alias yk_code_search="ykman oath code | grep -i '$@'"

# alias veracrypt="/Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt --text"
# alias vc="veracrypt"

# kapitan is cool, but overly complex and won't likely be used
# alias kapitan='function(){docker run -t --rm -v $(pwd):/src:delegated deepmind/kapitan:0.26 "$@"}'
# alias kap='kapitan $@'
#

# pulseaudio-equalizier
alias peq="qpaeq"
alias pulse-equalizer="qpaeq"

# colors
alias print_colors='for i in {0..255}; do print -Pn "%K{$i} %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%8)):#7}:+\\n}; done'

alias aol='function(){aws-okta login "$@"}'
alias aold='function(){aws-okta login dockerinc}'
alias aoe='function(){aws-okta exec "$1" "${@:2}"}'
alias aoed='function(){aws-okta exec dockerinc "${@:2}"}'
alias ao='function(){aws-okta "$@"}'
alias aod='function(){aws-okta dockerinc}'
alias aox='function(){eval $(aws-okta exec "$@" -- env | grep AWS | sed "s/^/export /");}'
alias aoxd='function(){eval $(aws-okta exec dockerinc -- env | grep AWS | sed "s/^/export /");}'

alias lpass_search='lpass ls | grep -i "$@"'

alias ecr_login='aws ecr get-login --no-include-email --region us-east-1 | sh'

alias gpg_list_encrypted_with='gpg --batch --list-packets $1 2>&1'

if [[ "$(uname)" == "Linux" ]]
then
  alias open="xdg-open"
fi

