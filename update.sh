#!/usr/bin/env bash

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
