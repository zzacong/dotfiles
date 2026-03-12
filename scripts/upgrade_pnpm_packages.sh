#!/bin/sh
#
# This script is used to upgrade all pnpm global packages
#
if command -v pnpm >/dev/null 2>&1; then
  pnpm update -g --latest
else
  echo "[ERROR] pnpm is not installed"
fi
