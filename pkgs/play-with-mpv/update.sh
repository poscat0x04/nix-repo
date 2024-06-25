#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
nix-prefetch-git https://github.com/Thann/play-with-mpv \
  | jq "del(.sha256) | del(.path) | del(.date)" \
  | tee source.json
jq -r ".rev" < source.json \
  | head -c 7 \
  | tee version
git add .
git commit -m "play-with-mpv: Auto updated to $(cat version)" || echo "No changes to commit"
