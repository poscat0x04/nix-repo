{ stdenv, fetchurl }:

with builtins;

stdenv.mkDerivation {
  name = "vlmcsd";
  version = readFile ./version;

  src = fetchurl (fromJSON (readFile ./source.json));

  outputs = [ "out" "man" ];

  installPhase = ''
    install -Dm755 bin/vlmcsd $out/bin/vlmcsd
    install -Dm755 bin/vlmcs $out/bin/vlmcs

    cd man
    gzip -fk *.[0-9]

    for manpage in *.[0-9]; do
      section=''${manpage##*.}
      install -Dm644 ''${manpage}.gz $man/share/man/man''${section}/''${manpage}.gz
    done
  '';
}
