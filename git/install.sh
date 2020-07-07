#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit


#curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
#git lfs install

# get the GitHub CLI latest release
# this is becoming a blocker because whatever the
# latest .deb file is is not valid
#deb_file="/tmp/gh_cli.deb"
#curl -sSL -H "$GITHUB_AUTHORIZATION_HEADER" $(curl -s -H "$GITHUB_AUTHORIZATION_HEADER" https://api.github.com/repos/cli/cli/releases | jq -r '.[0].assets | map(select(.name | contains("linux_amd64.deb"))) | .[0].browser_download_url') -o "$deb_file"
#sudo apt install -y "$deb_file"
#sudo rm "$deb_file"

# get the GitHub Desktop latest release
if [[ "$(uname)" == "Linux" ]];
then
  deb_file="/tmp/github_desktop.deb"
  curl -sSL -H "$GITHUB_AUTHORIZATION_HEADER" $(curl -s -H "$GITHUB_AUTHORIZATION_HEADER" https://api.github.com/repos/shiftkey/desktop/releases | jq -r '.[0].assets | map(select(.name | contains("deb"))) | .[0].browser_download_url') -o "$deb_file"
  sudo apt install -y "$deb_file"
  sudo rm "$deb_file"
  set +x
else
  echo 'n/a'
fi
