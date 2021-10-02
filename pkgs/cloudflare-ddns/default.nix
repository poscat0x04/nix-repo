{ rust-bin
, makeRustPlatform
, fetchFromGitHub
}:

let
  nightly = rust-bin.nightly.latest.minimal;
  rustPlatform = makeRustPlatform {
    rustc = nightly;
    cargo = nightly;
  };
in rustPlatform.buildRustPackage {
  pname = "cloudflare-ddns";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "poscat0x04";
    repo = "cloudflare-ddns-rs";
    rev = "2ee263786fece304a1878726030b5f38cea9900d";
    sha256 = "/LVPlHb7f/VWZqE9+6lyQV4c1feyfoZP7HPavxj98F4=";
  };

  cargoSha256 = "sha256-SNX//Xk3dSOuuaMFfSyvp1SsePae3fnyoz4cW70N+Zw=";
}
