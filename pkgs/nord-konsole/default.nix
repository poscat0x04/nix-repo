{ stdenv, fetchgit }:

with builtins;

stdenv.mkDerivation {
  pname = "nord-konsole";

  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  phases = "installPhase"; 

  installPhase = ''
    cp $src/src/nord.colorscheme $out
  '';
}
