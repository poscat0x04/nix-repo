#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch-scripts nixFlakes jq
cd "$(pwd)/$(dirname ${BASH_SOURCE})"
nix-prefetch-git https://github.com/arcticicestudio/nord-konsole \
  | jq "del(.path) | del(.date)" \
  | tee source.json
jq -r ".rev" < source.json \
  | head -c 7 \
  | tee version
git add .
git commit -m "nord-konsole: Auto updated to $(cat version)" || echo "No changes to commit"
