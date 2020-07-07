#!/usr/bin/env bash

#set -o pipefail
#set -o nounset
#set -o errexit


if [[ "$(uname)" == "Linux" ]]; then
  # misc tools
  # NOTE: do not install neovim, it's super outdated
  #
  # pcscd => PC/SC Smart Card Daemon for usage with Yubico-related apps
  # direnv => load environment variables based on an .envrc in the currend directory
  # exfat-fuse exfat-utils => needed to support reading exfat formatted disks
  # graphviz => way to use the terminal and code to create graphs easily
  # unbound => https://librelamp.com/Unbound
  sudo apt install -y \
    ruby python python3 python3-pip \
    curl \
    silversearcher-ag \
    build-essential \
    file \
    git \
    xclip \
    lastpass-cli \
    apt-transport-https \
    pulseaudio-equalizer \
    direnv \
    xdotool \
    wmctrl \
    inkscape inkscape-open-symbols inkscape-tutorials \
    exfat-fuse exfat-utils \
    zoom \
    graphviz \
    unbound \
    pcscd

  # configure direnv
  if [[ ! -d "$HOME/.config/direnv" ]]
  then
    mkdir -p "$HOME/.config/direnv"
  fi
  ln -s "$DOTFILES/linux/direnvrc" "$HOME/.config/direnv/direnvrc" || true


  # keybase install
  #if ! dpkg --no-pager -l keybase
  #then
  #  curl -sSL https://prerelease.keybase.io/keybase_amd64.deb -o /tmp/keybase.deb
  #  sudo apt install -y /tmp/keybase.deb
  #  run_keybase -f -g
  #  sudo rm /tmp/keybase.deb
  #fi

  # NOTE: Doesn't work for xubuntu eoan
  #
  #
  # yubico-desktop
  # yubico yubikey authenticator (TOTP)
  #if ! dpkg --no-pager -l yubikey-manager-qt yubioath-desktop yubikey-personalization-gui
  #then
  #  sudo add-apt-repository -y ppa:yubico/stable
  #  sudo apt update -y
  #  sudo apt install -y yubikey-manager-qt yubioath-desktop yubikey-personalization-gui
  #fi

  #
  # firefox beta
  #
  # crude check to see if the repository is already added
  # because ever since adding nextdns this takes rally
  # long (just hangs forever)
  if ! (ls /etc/apt/sources.list.d | grep firefox) > /dev/null
  then
    sudo add-apt-repository -y ppa:mozillateam/firefox-next
    sudo apt update -y
  fi
  if ! dpkg --no-pager -l firefox
  then
    sudo apt install firefox
  fi

  #
  # Slack
  #
    #wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
    #sudo apt install -y ./slack-desktop*.deb
    #sudo rm ./slack-desktop*.deb

  # Signal Desktop app. Using snap results in a broken app
  #if ! test -f /etc/apt/sources.list.d/signal-xenial.list
  #then
  #echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
  #sudo apt update -y
  #fi
  #curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
  #sudo apt install -y signal-desktop

  if ! snap list | egrep 'signal-desktop' > /dev/null
  then
    sudo snap install signal-desktop --channel latest/beta
  fi


  #
  # Spotify
  #
  if ! test -f /etc/apt/sources.list.d/spotify.list
  then
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update -y
  fi
  curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
  sudo apt install -y spotify-client

  #
  # Pritunl
  #
  if ! test -f /etc/apt/sources.list.d/pritunl.list
  then
    echo 'deb http://repo.pritunl.com/stable/apt bionic main' | sudo tee /etc/apt/sources.list.d/pritunl.list
    sudo apt update -y
  fi
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
  sudo apt-get install -y pritunl-client-electron

  #
  # Brave Browser
  # NOTE: Brave kept feeling laggy when focusing the browser
  #
  if ! test -f /etc/apt/sources.list.d/brave-browser-release.list
  then
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt-get update -y
  fi
  curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add
  sudo apt-get install -y brave-browser

  #
  # Albert
  #
  if ! test -f /etc/apt/sources.list.d/home:manuelschneid3r.list
  then
    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_19.10/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
    sudo apt-get update -y
  fi
  curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
  wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_19.10/Release.key -O /tmp/albert_release.key
  sudo apt-key add - < /tmp/albert_release.key
  sudo rm /tmp/albert_release.key
  sudo apt-get install -y albert

  #
  # Shellcheck
  # NOTE: WHY DOES THIS NOT WORK!?!?!?
  #
  #sleep 10
  #og_dir=$(pwd)
  #dest=/usr/local/bin/shellcheck
  #tmp_dir=$(mktemp -d)
  #tar_file="${tmp_dir}/shellcheck.tar.xz"
  #set -x
  #curl -sSL -H "$GITHUB_AUTHORIZATION_HEADER" "$(curl -s -H $GITHUB_AUTHORIZATION_HEADER https://api.github.com/repos/koalaman/shellcheck/releases | jq -r '.[0].assets | map(select(.name | contains("x86_64"))) | .[0].browser_download_url')" -o "$tar_file"
  #set +x
  #sudo tar -xvf "$tar_file" -C "$tmp_dir"
  #ls "$tmp_dir"
  #cd "${tmp_dir}"/shellcheck-* || exit 1
  #sudo cp ./shellcheck "$dest"
  #sudo chmod +x "$dest"
  #sudo rm -rf "$tmp_dir"
  #cd "$og_dir" || exit 1
  #echo
  #echo '>> shellcheck installed!'
  #echo

  #
  # Tomb
  #
  echo
  echo '-----------------------------------------------'
  echo '-----------------------------------------------'
  echo "SKIPPING Tomb install because it is error prone"
  echo '-----------------------------------------------'
  echo '-----------------------------------------------'
  echo
  echo
  #og_dir=$(pwd)
  #tmp_dir=$(mktemp -d)
  #tar_file="${tmp_dir}/tomb.tar.gz"
  #curl -sSL -H "$GITHUB_AUTHORIZATION_HEADER" "$(curl -s -H "$GITHUB_AUTHORIZATION_HEADER" https://api.github.com/repos/dyne/Tomb/tags | jq -r '.[0].tarball_url')" -o "$tar_file"
  #sudo tar -xvf $tar_file -C $tmp_dir
  #ls $tmp_dir
  #cd ${tmp_dir}/dyne-Tomb-* || exit 1
  #sudo make install
  #sudo rm -rf $tmp_dir
  #cd $og_dir || exit 1
  #echo
  #echo '>> tomb installed!'
  #echo
fi
