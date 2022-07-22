#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Pritunl Staging
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Connect to the the Staging VPN (Pritunl)
# @raycast.author Alex Hokanson
# @raycast.authorURL https://github.com/ingshtrom

/usr/local/bin/gotunl -c stage
