{ fetchgit, rustPlatform, openssl, pkg-config }:

with builtins;

rustPlatform.buildRustPackage rec {
  pname = "project-init";
  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  buildInputs = [
    openssl
  ];

  nativeBuildInputs = [
    pkg-config
  ];

  cargoSha256 = readFile ./cargoSha256;
}
