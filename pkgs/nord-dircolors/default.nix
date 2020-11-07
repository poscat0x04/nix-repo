{ stdenv, fetchgit }:

with builtins;

stdenv.mkDerivation {
  pname = "nord-dircolors";

  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  phases = "installPhase"; 

  installPhase = ''
    cp $src/src/dir_colors $out
  '';
}
