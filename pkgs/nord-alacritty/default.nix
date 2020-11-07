{ stdenv, yaml2json, jq, fetchgit, ... }:

stdenv.mkDerivation rec {
  pname = "nord-alacritty";

  version = builtins.readFile ./version;

  src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));

  nativeBuildInputs = [
    yaml2json
    jq
  ];

  phases = "buildPhase";

  buildPhase = ''
    yaml2json < $src/src/nord.yml | jq > $out
  '';
}
