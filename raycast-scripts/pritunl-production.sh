#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Pritunl Production
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Connect to VPN for Production (Pritunl)
# @raycast.author Alex Hokanson
# @raycast.authorURL https://github.com/ingshtrom

/usr/local/bin/gotunl -c prod
