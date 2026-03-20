#!/usr/bin/env bash

file="$1"
mime="$(file --mime-type -Lb "$file")"

case "$file" in
  *.md | *.markdown | *.mdown)
    glow -s dark -w "${FZF_PREVIEW_COLUMNS:-80}" "$file"
    ;;
  *)
    case "$mime" in
      text/* | application/json)
        bat --color=always --style=plain "$file"
        ;;
      *)
        file -Lb "$file"
        ;;
    esac
    ;;
esac