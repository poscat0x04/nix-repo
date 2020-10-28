#!/usr/bin/env zsh 
if [[ ! -n $1 ]]; then
  exit 1
fi
font_dir="$1"
font_files=($(nix eval -f files.nix --json | jq -r -c ".[]"))
hashes=()
for f in $font_files
do
  h=$(nix hash-file --base32 "${font_dir}/${f}")
  hashes+=$h
done
echo "${hashes[@]}" | jq -R '. | split(" ")' > hashes.json
