#!/usr/bin/env nix-shell
#!nix-shell -i bash

for f in pkgs/**/update.sh; do
  dir="$(dirname "$f")"
  echo "running update script in $dir ... "
  "$f"
done

echo "updating lock file"
update=$(nix flake update . --recreate-lock-file 2>&1 | grep Updated)
git add flake.lock
git commit -m "flake.lock: Auto update

Input changes:

$update" || echo "No changes to commit"

echo "Uploading to cachix"

packages=(project-init
          fcitx5-material-color)

for p in ${packages[@]}
do
  echo "Building ${p}"
  nix build -L --json ".#${p}" | jq -r ".[0].outputs.out" | cachix push nix-repo
done
