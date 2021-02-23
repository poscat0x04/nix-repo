{ stdenv, fetchgit }:

with builtins;

stdenv.mkDerivation rec {
  pname = "fcitx5-material-color";
  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  installPhase = ''
    install -Dm644 arrow.png radio.png -t $out/share/${pname}/
    for variant in blue brown deepPurple indigo pink red teal; do
      variant_name=Material-Color-''${variant^}
      mkdir -p $out/share/fcitx5/themes/$variant_name/
      ln -s ../../../${pname}/arrow.png $out/share/fcitx5/themes/$variant_name/
      ln -s ../../../${pname}/radio.png $out/share/fcitx5/themes/$variant_name/
      install -Dm644 theme-$variant.conf $out/share/fcitx5/themes/$variant_name/theme.conf
      sed -i "s/^Name=.*/Name=$variant_name/" $out/share/fcitx5/themes/$variant_name/theme.conf
    done
  '';
}
