#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
nix-prefetch-git https://github.com/jesec/flood \
  | jq "del(.sha256) | del(.path) | del(.date)" \
  | tee source.json
jq -r ".rev" < source.json \
  | head -c 7 \
  | tee version

curl -LO https://github.com/jesec/flood/raw/master/package-lock.json
prefetch-npm-deps package-lock.json | head -c 51 | tee hash

git add .
git commit -m "flood-git: Auto updated to $(cat version)" || echo "No changes to commit"
