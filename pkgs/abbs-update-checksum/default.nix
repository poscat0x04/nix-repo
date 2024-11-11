{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, stdenv
, darwin
}:

rustPlatform.buildRustPackage rec {
  pname = "abbs-update-checksum";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "AOSC-Dev";
    repo = "abbs-update-checksum";
    rev = "v${version}";
    hash = "sha256-HmhR1qtt/RUpytAXX6tYsxi/dnTPcBd55/cfEONAsSo=";
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
    description = "A tool to update ABBS tree package checksums";
    homepage = "https://github.com/AOSC-Dev/abbs-update-checksum";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "abbs-update-checksum";
  };
}
