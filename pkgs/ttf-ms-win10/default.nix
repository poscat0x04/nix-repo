{ stdenv, requireFile, zipListsWith }:

let
  files = import ./files.nix;
  hashes = import ./hashes.nix;
in
  stdenv.mkDerivation rec {
    pname = "ttf-ms-win10";

    version = "10.0.18362.116";

    srcs = zipListsWith (file: hash: requireFile {
      name = file;
      sha256 = hash;
      url = "";
    }) files hashes;

    phases = "installPhase";

    installPhase = ''
      mkdir -p "$out/share/fonts/truetype"
      fonts=($srcs)
      install -Dm644 ''${srcs[@]} -t "$out/share/fonts/truetype"
    '';
  }
