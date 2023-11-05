#!/usr/bin/env zsh

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title My ifconfig
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🛜
# @raycast.packageName Raycast Scripts
# @raycast.author Zac Ong

# ip_addr=$(curl -s ifconfig.me/ip)

# print output in green text
# echo -e "\033[32m$ip_addr\033[0m"

result=$(curl -s ifconfig.co/json)

echo $result

