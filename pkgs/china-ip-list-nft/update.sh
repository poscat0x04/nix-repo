#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
nix-prefetch-git https://github.com/17mon/china_ip_list \
  | jq "del(.path) | del(.date)" \
  | tee source.json
jq -r ".rev" < source.json \
  | head -c 7 \
  | tee version

git add .
git commit -m "china-ip-list-nft: Auto updated to $(cat version)" || echo "No changes to commit"
