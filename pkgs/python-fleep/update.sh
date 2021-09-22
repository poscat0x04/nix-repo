#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
nix-prefetch-git https://github.com/floyernick/fleep-py \
  | jq "del(.path) | del(.date)" \
  | tee source.json
jq -r ".rev" < source.json \
  | head -c 7 \
  | tee version

git add .
git commit -m "python-fleep: Auto updated to $(cat version)" || echo "No changes to commit"
