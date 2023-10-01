{ fetchgit
, buildNpmPackage
}:

buildNpmPackage {
  pname = "flood";
  version = builtins.readFile ./version;

  src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));

  npmDepsHash = builtins.readFile ./hash;
}
