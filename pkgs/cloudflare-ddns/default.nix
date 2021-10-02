{ rust-bin
, makeRustPlatform
, fetchFromGitHub
}:

let
  nightly = rust-bin.nightly."2021-10-01".minimal;
  rustPlatform = makeRustPlatform {
    rustc = nightly;
    cargo = nightly;
  };
in rustPlatform.buildRustPackage rec {
  pname = "cloudflare-ddns";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "poscat0x04";
    repo = "cloudflare-ddns-rs";
    rev = "${version}";
    sha256 = "R9yt0vSNclraGnlzUd68wIp3N7psnBreGmTBuqo4t+Y=";
  };

  cargoSha256 = "sha256-tvIOfZuauzSruAYxx15/JKDwzhEhaelxV+ER8ixchv8=";
}
