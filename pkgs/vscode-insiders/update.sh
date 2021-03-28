#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
url="https://update.code.visualstudio.com/latest/linux-x64/insider"
new_url="$(curl -LsI -o /dev/null -w %{url_effective} $url)"
echo "{}" | jq --arg url  "$new_url" \
               --arg sha256 "$(nix-prefetch-url $url)" \
               '.url = $url | .sha256 = $sha256' > source.json
echo "$new_url" | grep -Po '(?<=-)[0-9]+(?=.)' | tr -d '\n' > version
git add .
git commit -m "vscode-insiders: Auto updated to $(cat version)" || echo "No changes to commit"
