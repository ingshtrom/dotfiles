#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

# install container-diff
# curl -LO https://storage.googleapis.com/container-diff/latest/container-diff-darwin-amd64 && chmod +x container-diff-darwin-amd64 && sudo mv container-diff-darwin-amd64 /usr/local/bin/container-diff

if [[ "$(uname)" == "Linux" ]]; then
  # install docker, but from bionic PPAs because the EOAN ones have a renamed containerd package
  # thus, docker-ce and docker-ce-cli fails to install due to lacking dependencies to install
  if ! $(which docker) > /dev/null
  then
    sudo apt install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'
    sudo apt update -y
    sudo apt install -y docker-ce/bionic docker-ce-cli/bionic containerd.io/bionic
  fi

  # install the docker-credential-secretservice credential helper
  # TODO
  #curl -sSL -H "$GITHUB_AUTHORIZATION_HEADER" $(curl -s -H "$GITHUB_AUTHORIZATION_HEADER" https://api.github.com/repos/kovidgoyal/kitty/releases | jq -r '.[0].assets | map(select(.label | contains("Linux amd64"))) | .[0].browser_download_url') -o "$tar_file"

  # install img, because we don't really need all the fancy `docker-ce` stuff
  # plus, it doesn't work with VPN right now
  if ! $(which img) > /dev/null
  then
    sudo apt install uidmap libseccomp-dev
    curl -fSL "https://github.com/genuinetools/img/releases/download/v0.5.7/img-linux-amd64" -o /tmp/img
    sudo chmod a+x /tmp/img
    sudo mv /tmp/img /usr/local/bin/
  fi

  # install k3c, so we have the `docker run` in case we need it,
  # since docker-ce doesn't work
  if ! $(which k3c) > /dev/null
  then
    curl -fSL "https://github.com/rancher/k3c/releases/download/v0.0.1/k3c" -o /tmp/k3c
    sudo chmod a+x /tmp/k3c
    sudo mv /tmp/k3c /usr/local/bin/
  fi
fi
