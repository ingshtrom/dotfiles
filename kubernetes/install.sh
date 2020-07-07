#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

# given a full semver, keep incrementing the
# patch version until there is no longer a valid
# kubectl available
#
# params:
#   $1 => os, linux|darwin
#   $2 => version, v1.15.0 
get_latest_patch_version() {
  os=$1
  valid_version=$2
  cur_version=$valid_version
  while true
  do
    if ! ( curl --head -v "https://storage.googleapis.com/kubernetes-release/release/${cur_version}/bin/${os}/amd64/kubectl" 2>&1 | grep -E '^< HTTP' | grep -E '200' > /dev/null )
    then
      echo "$valid_version"
      return
    fi
    valid_version=$cur_version
    cur_version="v$( echo $cur_version | xargs -L1 semver -i patch )"
  done
}

KUBECTL_TARGET_VERSION="v1.15.0"

# install tanka and needed binaries
# docs: https://tanka.dev
os=$(uname)
if [[ "$os" == "Darwin" ]]; then
  curl -fSL -o "/usr/local/bin/tk" "https://github.com/grafana/tanka/releases/download/v0.6.1/tk-darwin-amd64"
  go get -u github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb

  KUBECTL_VERSION=$( get_latest_patch_version darwin $KUBECTL_TARGET_VERSION )
  curl -sSL "https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/darwin/amd64/kubectl" --output /tmp/kubectl
  sudo mv /tmp/kubectl /usr/local/bin/kubectl
  sudo chmod +x /usr/local/bin/kubectl
fi

if [[ "$os" == "Linux" ]]; then
  KUBECTL_VERSION=$( get_latest_patch_version linux $KUBECTL_TARGET_VERSION )
  curl -sSL "https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl" --output /tmp/kubectl
  sudo mv /tmp/kubectl /usr/local/bin/kubectl
  sudo chmod +x /usr/local/bin/kubectl
fi

if [[ ! -f "/usr/local/bin/kubectl_latest" ]]; then
  sudo ln -s $(brew --prefix)/bin/kubectl /usr/local/bin/kubectl_latest
fi

if ! which kubectx
then
  # install go-kubectx, which includes `kubectx` and `kubens`,
  # but faster than the originals
  # NOTE: this relies on the Brewfile to install `fzf` in order
  # to actually use kubectx/kubens
  dir="$GOPATH/src/github.com/aca"
  mkdir -p "$dir"
  git -C "$dir" clone git@github.com:aca/go-kubectx.git
  cd "$dir/go-kubectx"
  go install ./cmd/kubens
  go install ./cmd/kubectx
fi

