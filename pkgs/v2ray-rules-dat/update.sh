#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
version=$(curl "https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/tags" | jq -r ".[0].name")
if [ -z "$version" ]
then
  echo "version fetch failed"
  exit 1
fi

url_geoip="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$version/geoip.dat"
url_geosite="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$version/geosite.dat"
sha256_geoip=$(nix-prefetch-url $url_geoip)
sha256_geosite=$(nix-prefetch-url $url_geosite)

echo "{}" \
  | jq ".url_geoip=\"$url_geoip\" | .sha256_geoip=\"$sha256_geoip\"" \
  | jq ".url_geosite=\"$url_geosite\" | .sha256_geosite=\"$sha256_geosite\"" \
  | tee source.json

git add .
git commit -m "v2ray-rules-dat: Auto updated to $version" || echo "No changes to commit"
