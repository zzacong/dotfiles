#!/bin/sh
#
# This script is used to upgrade all pnpm global packages
#
if command -v "pnpm" &> /dev/null; then
	pnpm i -g $(pnpm ls -g | rg '\d$' | sed -e '/^\//d' -e 's/ [0-9]*\.[0-9]*\.[0-9]*//' | xargs)
else
	echo "[ERROR] pnpm is not installed"
fi

