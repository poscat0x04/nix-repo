#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nixFlakes jq curl nix-prefetch-github
cd "$(pwd)/$(dirname ${BASH_SOURCE})"
url="https://raw.githubusercontent.com/arcticicestudio/nord-alacritty/develop/src/nord.yml"
echo "{}" | jq --arg url  "$url" \
               --arg sha256 "$(nix-prefetch-url $url)" \
               '.url = $url | .sha256 = $sha256' > source.json
nix-prefetch-github arcticicestudio nord-alacritty | jq -r '.rev' | head -c 7 | tr -d n > version
ver="$(cat version)"
git add .
git commit -m "alacritty-nord: Auto updated to $ver" || echo "No changes to commit"
