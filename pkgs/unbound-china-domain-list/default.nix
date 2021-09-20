{ stdenv
, lib
, fetchgit
, servers ? [ "223.5.5.5" "223.6.6.6" "119.29.29.29" "119.28.28.28" ]
}:

with builtins;
let
  server-str = "[ " + lib.concatMapStringsSep " " (server: "\"${server}\"") servers + " ]";
in stdenv.mkDerivation {
  pname = "unbound-china-domain-list";

  version = builtins.readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  phases = [ "buildPhase" ];

  buildPhase = ''
    echo "[" >> $out
    for f in apple google accelerated-domains
    do sed -r 's|server=/(.*)/114.114.114.114$|{ name = "\1."; forward-addr = ${server-str}; }|' $src/$f.china.conf >> $out
    done
    echo "]" >> $out
  '';
}
