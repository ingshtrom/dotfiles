#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

mode="${1:-personal}"

if [[ "$mode" == "work" ]]
then
  cat <<EOF > $HOME/.passrc
export PASSWORD_STORE_DIR=$HOME/.password-store
export __PASSWORD_STORE_MODE=work
EOF
  echo "Set password store mode to 'work'"
else
  cat <<EOF > $HOME/.passrc
export PASSWORD_STORE_DIR=$HOME/.password-store-personal
export PASSWORD_STORE_GENERATED_LENGTH=128
export PASSWORD_STORE_GENERATED_LENGTH='[:print:]'
export __PASSWORD_STORE_MODE=personal
EOF
  echo "Set password store mode to 'personal'"
fi


