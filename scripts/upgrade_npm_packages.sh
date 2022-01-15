#!/bin/sh
#
# This script is used to upgrade all npm global packages
#
if command -v "npm" &> /dev/null; then
	npm ls -g --depth 0 | awk '/@/ && !/npm|corepack/' | cut -d ' ' -f 2 | cut -d '@' -f 1 | xargs -I {} npm i -g {}
else
	echo "[ERROR] npm is not installed"
fi
