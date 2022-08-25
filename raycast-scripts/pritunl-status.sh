#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Pritunl Status
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Get status of Pritunl VPNs
# @raycast.author Alex Hokanson
# @raycast.authorURL https://github.com/ingshtrom

/usr/local/bin/gotunl -l
