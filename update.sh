for f in pkgs/**/update.sh; do
  dir="$(dirname "$f")"
  echo "running update script in $dir ... "
  "$f"
done

echo "Uploading to cachix"

packages=(fcitx5-material-color
          codelldb)

for p in "${packages[@]}"
do
  echo "Building ${p}"
  nix build -L --json ".#${p}" | jq -r ".[0].outputs.out" | cachix push nix-repo
done
