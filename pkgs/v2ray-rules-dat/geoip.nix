{ fetchurl }:

let
  src = builtins.fromJSON (builtins.readFile ./source.json);
in
  fetchurl {
    url = src.url_geoip;
    sha256 = src.sha256_geoip;
  }
