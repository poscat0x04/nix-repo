#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
version=$(curl "https://api.github.com/repos/seemoo-lab/opendrop/tags" | jq -r ".[0].name")
if [ -z "$version" ]
then
  echo "version fetch failed"
  exit 1
fi

nix-prefetch-git --rev $version https://github.com/seemoo-lab/opendrop \
  | jq "del(.path) | del(.date)" \
  | tee source.json
echo -n $version | tee version

git add .
git commit -m "opendrop: Auto updated to $(cat version)" || echo "No changes to commit"
