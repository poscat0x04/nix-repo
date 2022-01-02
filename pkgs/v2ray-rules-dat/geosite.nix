{ stdenv, fetchurl }:

let
  src = builtins.fromJSON (builtins.readFile ./source.json);
  file = fetchurl {
    url = src.url_geosite;
    sha256 = src.sha256_geosite;
  };
in stdenv.mkDerivation rec {
  pname = "geosite.dat";
  name = pname;

  phases = [ "installPhase" ];

  installPhase = ''
    install -m 0644 ${file} -D $out/share/v2ray/geosite.dat
  '';
}
