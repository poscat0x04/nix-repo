{ fetchgit
, buildPythonPackage
}:

with builtins;

buildPythonPackage rec {
  pname = "ctypescrypto";

  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  doCheck = false;
}
