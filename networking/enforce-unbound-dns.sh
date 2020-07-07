#!/usr/bin/env bash

set -e

grep expressvpn > /dev/null 2>&1 < /etc/resolv.conf
cat_return_code="$?"

if [[ "$cat_return_code" == "0" ]]
then
  echo "found expressvpn is set as DNS, overwriting back to localhost"
  echo "nameserver 127.0.0.1" | sudo tee /etc/resolv.conf
  sudo systemctl restart resolvconf
fi

