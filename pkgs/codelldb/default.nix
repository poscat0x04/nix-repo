{ stdenv, lib, fetchgit, rustPlatform }:

with builtins;

rustPlatform.buildRustPackage {
  pname = "codelldb";
  version = lib.removePrefix "v" (readFile ./version);
  src = fetchgit (fromJSON (readFile ./source.json));

  cargoSha256 = readFile ./cargoSha256;

  # It will pollute the build environment of `buildRustPackage`.
  cargoPatches = [ ./reset-cargo-config.patch ];

  buildAndTestSubdir = "adapter";

  cargoFlags = [
    "--lib"
    "--bin=codelldb"
    "--features=weak-linkage"
  ];

  fixupPhase = ''
    mv $out/lib/* $out/bin
    rmdir $out/lib
  '';

  doCheck = false;
}
