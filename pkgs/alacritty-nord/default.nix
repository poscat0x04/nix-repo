{ stdenv, yaml2json, jq, ... }:

stdenv.mkDerivation rec {
  pname = "alacritty-nord";

  version = builtins.readFile ./version;

  src = builtins.fetchurl (builtins.fromJSON (builtins.readFile ./source.json));

  nativeBuildInputs = [
    yaml2json
    jq
  ];

  phases = "buildPhase";

  buildPhase = ''
    yaml2json < $src | jq > $out
  '';
}
