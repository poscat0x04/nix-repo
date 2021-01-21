#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
version=$(curl "https://api.github.com/repos/vadimcn/vscode-lldb/releases" | jq -r ".[0].tag_name")
if [ -z "$version" ]
then
  echo "version fetch failed"
  exit 1
fi

nix-prefetch-git --rev "$version" --fetch-submodules https://github.com/vadimcn/vscode-lldb \
  | jq "del(.path) | del(.date)" \
  | tee source.json

cargoSha256=$(nix-prefetch '{ sha256 }: (import ./../..).packages.${builtins.currentSystem}.codelldb.cargoDeps.overrideAttrs (_: { cargoSha256 = sha256; })')
if [ -z "$cargoSha256" ]
then
  echo "fetching new cargoSha256 failed"
  exit 1
fi
echo -n $version | tee version
echo $cargoSha256 | tee cargoSha256

git add .
git commit -m "codelldb: Auto updated to $version" || echo "No changes to commit"
