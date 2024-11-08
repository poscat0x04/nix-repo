{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, libgit2
, openssl
, xz
, zlib
, zstd
, systemd
}:

rustPlatform.buildRustPackage rec {
  pname = "ciel";
  version = "3.5.1";

  src = fetchFromGitHub {
    owner = "AOSC-Dev";
    repo = "ciel-rs";
    rev = "v${version}";
    hash = "sha256-yiyblFZLkcG637xsrJoRSLLgtWuYthT+vajk3ypHJ74=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "libmount-0.1.15" = "sha256-JObYz6AUWhvz8q+9DdsbMWm7zNQmMW73WAt+LjY5TV0=";
    };
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    libgit2
    openssl
    xz
    zlib
    zstd
    systemd.dev
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
    CIEL_GEN_COMPLETIONS = true;
  };

  preInstall = ''
    PREFIX=$out bash $src/install-assets.sh
  '';

  postInstall = ''
    mv $out/bin/ciel-rs $out/bin/ciel
  '';

  meta = with lib; {
    description = "A tool for controlling AOSC OS packaging environments using multi-layer filesystems and containers (version 3";
    homepage = "https://github.com/AOSC-Dev/ciel-rs";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "ciel";
  };
}
