#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
nixpkgs-firefox-addons addons.json addons.nix
git add .
git commit -m "firefox-addons: Auto update" || echo "No changes to commit"
