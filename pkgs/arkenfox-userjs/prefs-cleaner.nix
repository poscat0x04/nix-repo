{ stdenv, fetchgit }:

with builtins;

stdenv.mkDerivation {
  pname = "prefs-cleaner";

  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin
    cp $src/prefsCleaner.sh $out/bin/prefs-cleaner
    chmod +x $out/bin/prefs-cleaner
  '';
}
