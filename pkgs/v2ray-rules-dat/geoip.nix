{ stdenv, fetchurl }:

let
  src = builtins.fromJSON (builtins.readFile ./source.json);
  file = fetchurl {
    url = src.url_geoip;
    sha256 = src.sha256_geoip;
  };
in stdenv.mkDerivation rec {
  pname = "geoip.dat";
  name = pname;

  phases = [ "installPhase" ];

  installPhase = ''
    install -m 0644 ${file} -D $out/share/v2ray/geoip.dat
  '';
}
