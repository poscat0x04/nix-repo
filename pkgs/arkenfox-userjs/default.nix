{ stdenv, fetchgit, nodejs }:

with builtins;

stdenv.mkDerivation {
  pname = "arkenfox-userjs";

  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  nativeBuildInputs = [ nodejs ];

  phases = [ 
    "unpackPhase"
    "buildPhase"
    "installPhase"
  ];

  buildPhase = ''
    node ${./user_js_to_json.js}
  '';

  installPhase = ''
    cp user.json $out
  '';
}
