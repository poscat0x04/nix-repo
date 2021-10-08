for f in pkgs/**/update.sh; do
  dir="$(dirname "$f")"
  echo "running update script in $dir ... "
  "$f"
done
