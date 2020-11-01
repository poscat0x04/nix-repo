#!/usr/bin/env nix-shell
#!nix-shell -i bash -p jq nix-prefetch-github
cd "$(pwd)/$(dirname ${BASH_SOURCE})"
nix-prefetch-github arkenfox user.js > source.json
jq -r ".rev" < source.json | head -c 7 > version
git add .
git commit -m "arkenfox-userjs: Auto updated to $(cat version)" || echo "No changes to commit"
