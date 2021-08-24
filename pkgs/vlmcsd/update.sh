#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
version=$(curl "https://api.github.com/repos/Wind4/vlmcsd/tags" | jq -r ".[0].name")
if [ -z "$version" ]
then
  echo "version fetch failed"
  exit 1
fi

url="https://archive.fastgit.org/Wind4/vlmcsd/archive/$version.tar.gz"
sha256=$(nix-prefetch-url $url)

echo -n $version | tee version
echo "{}" \
  | jq ".url=\"$url\" | .sha256=\"$sha256\"" \
  | tee source.json

git add .
git commit -m "vlmcsd: Auto updated to $(cat version)" || echo "No changes to commit"
