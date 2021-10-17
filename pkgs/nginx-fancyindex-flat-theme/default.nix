{ stdenv
, fetchgit
, nodePackages
, lessc
}:

with builtins;

stdenv.mkDerivation {
  pname = "nginx-fancyindex-flat-theme";
  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  configurePhase = ''
    export NODE_PATH=${nodePackages.less-plugin-clean-css}/lib/node_modules
  '';

  nativeBuildInputs = [
    nodePackages.uglify-js
    lessc
  ];

  installPhase = ''
    mkdir -p $out
    cp -r build/* $out
  '';
}
