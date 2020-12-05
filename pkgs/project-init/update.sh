#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
nix-prefetch-git https://github.com/vmchale/project-init \
  | jq "del(.path) | del(.date)" \
  | tee source.json
jq -r ".rev" < source.json \
  | head -c 7 \
  | tee version
export XDG_RUNTIME_DIR=$(mktemp -d)
export NIX_PATH="nixpkgs=https://github.com/nixos/nixpkgs/archive/nixpkgs-unstable.tar.gz"
cargoSha256=$(nix-prefetch '{ sha256 }: (import ./../..).packages.${builtins.currentSystem}.project-init.cargoDeps.overrideAttrs (_: { cargoSha256 = sha256; })')

if [ -z "$cargoSha256" ]
then
  echo "fetching new cargoSha256 failed"
  exit 1
fi

echo $cargoSha256 | tee cargoSha256
git add .
git commit -m "project-init: Auto updated to $(cat version)" || echo "No changes to commit"
