#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

if [[ "$(name)" == "Linux" ]]
then
  sudo update-ca-certificates
fi

# this is useful if i ever want to go back to nextdns for local DNS resolver
sudo tee /etc/nextdns.conf > /dev/null < $DOTFILES/networking/nextdns.conf

# sudo tee /etc/unbound/unbound.conf > /dev/null < $DOTFILES/networking/unbound.conf
# sudo ln -s -f $DOTFILES/networking/resolv.conf /etc/resolv.conf
# sudo ln -s -f $DOTFILES/networking/enforce-unbound-dns.cron /etc/cron.d/enforce-unbound-dns
# sudo unbound-control-setup

# sudo systemctl daemon-reload
# we use nextdns because we don't need a recursive resolver locally
# sudo systemctl disable unbound
# sudo systemctl stop unbound

# need to turn off ipv6 because it fails with Xfinity... boooooo
# found this by investigating a ruby gem issue: https://github.com/rubygems/rubygems/issues/2253
if [[ "$(uname)" == "Linux" ]]
then
  sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
  sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
fi

