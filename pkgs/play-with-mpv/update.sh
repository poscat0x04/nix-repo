#!/usr/bin/env nix-shell
#!nix-shell -i bash -p jq nix-prefetch-github
cd "$(pwd)/$(dirname ${BASH_SOURCE})"
nix-prefetch-github Thann play-with-mpv > source.json
ver="$(jq -r ".rev" < source.json | head -c 7)"
git add .
git commit -m "play-with-mpv: Auto updated to ${ver}" || echo "No changes to commit"
