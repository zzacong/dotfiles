#!/usr/bin/env zsh

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title My internal IP
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🛜
# @raycast.packageName Raycast Scripts
# @raycast.author Zac Ong

result=$(ifconfig | rg -oe "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b")

echo $result

