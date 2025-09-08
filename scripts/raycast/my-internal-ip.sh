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

# result=$(ifconfig | rg -oe "\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b")
result=$(ifconfig en0 | grep "inet " | awk '{print $2}')

echo $result | pbcopy

echo $result
