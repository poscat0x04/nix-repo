#!/usr/bin/env bash

cd "$(pwd)/$(dirname ${BASH_SOURCE})"
version=$(curl "https://api.github.com/repos/standardnotes/desktop/tags" | jq -r ".[0].name")
version=${version:1}
if [ -z "$version" ]
then
  echo "version fetch failed"
  exit 1
fi

url="https://github.com/standardnotes/desktop/releases/download/v$version/standard-notes-$version-linux-x86_64.AppImage"
sha256=$(nix-prefetch-url $url)

echo -n $version | tee version
echo "{}" \
  | jq ".url=\"$url\" | .sha256=\"$sha256\"" \
  | tee source.json

git add .
git commit -m "standardnotes: Auto updated to $(cat version)" || echo "No changes to commit"
