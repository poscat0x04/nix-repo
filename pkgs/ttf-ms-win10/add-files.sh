#!/usr/bin/env zsh
if [[ ! -n $1 ]]; then
  exit 1
fi
font_dir="$1"
font_files=($(nix eval -f files.nix --json | jq -r -c ".[]"))
for f in $font_files
do
  nix-store --add-fixed sha256 "${font_dir}/${f}"
done
