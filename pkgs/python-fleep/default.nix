{ fetchgit
, buildPythonPackage
}:

with builtins;

buildPythonPackage rec {
  pname = "fleep";

  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));
}
