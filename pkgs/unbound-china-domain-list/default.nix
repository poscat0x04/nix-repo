{ stdenv, fetchgit, server ? "223.5.5.5" }:

with builtins;

stdenv.mkDerivation {
  pname = "unbound-china-domain-list";

  version = builtins.readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  phases = [ "buildPhase" ];

  buildPhase = ''
    echo "[" >> $out
    for f in apple google accelerated-domains
    do sed -r 's|server=/(.*)/114.114.114.114$|{ name = "\1."; forward-addr = "${server}"; }|' $src/$f.china.conf >> $out
    done
    echo "]" >> $out
  '';
}
