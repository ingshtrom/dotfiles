#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title AWS Okta Login
# @raycast.mode inline

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "dockerinc.main", "optional": true }
# @raycast.argument2 { "type": "text", "placeholder": "true", "optional": true }
# @raycast.packageName AWS Okta Login

# Documentation:
# @raycast.description Log into the AWS Console
# @raycast.author Alex Hokanson
# @raycast.authorURL https://github.com/ingshtrom

#echo "Hello World! Argument1 value: "$1""
profile=${1:-dockerinc.main}
open_console=${2:-true}

echo "Profile: ${profile}"

cmd="aws-okta login '${profile}' --mfa-factor-type='token:software:totp' --mfa-provider='GOOGLE'"
if [[ "$open_console" = false ]]; then
  cmd="aws-okta exec '${profile}' --mfa-factor-type='token:software:totp' --mfa-provider='GOOGLE' -- echo 'logged in!'"
fi

exit_code=999

echo 'foo' | eval "$cmd" 2>&1
exit_code=$?


if [[ "$exit_code" != "0" ]]; then
  echo "----------------------"
  echo
  echo "try again with 1Password... output:"
  op item get okta --otp | eval $cmd 2>&1
fi
