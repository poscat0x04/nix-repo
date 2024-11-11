{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, stdenv
, darwin
}:

rustPlatform.buildRustPackage rec {
  pname = "aosc-findupdate";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "AOSC-Dev";
    repo = "aosc-findupdate";
    rev = "v${version}";
    hash = "sha256-6UP98lCxsS1SIw18GzQSnzPUlTdBCd9s2h9uIqBEkPE=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "abbs-meta-apml-0.1.0" = "sha256-ZDQH2EUdvGIPzlLQ5A7/Xre3JjlczVP6LSQgK6IZ1sQ=";
      "conch-parser-0.1.1" = "sha256-eioYbki4aEHoriBsKqnfa1ViuS+B8dYhjL6S3xA1Fms=";
    };
  };

  doCheck = false;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  meta = with lib; {
    description = "A small utility to help find updates in AOSC OS ABBS trees";
    homepage = "https://github.com/AOSC-Dev/aosc-findupdate";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ ];
    mainProgram = "aosc-findupdate";
  };
}
