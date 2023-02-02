#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Pritunl Command
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📶
# @raycast.argument1 { "type": "text", "placeholder": "-c stage", "optional": true }
# @raycast.packageName Pritunl



# Documentation:
# @raycast.description Run Pritunl commands
# @raycast.author Alex Hokanson
# @raycast.authorURL https://github.com/ingshtrom

/usr/local/bin/gotunl $1
