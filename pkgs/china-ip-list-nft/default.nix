{ stdenv, fetchgit, nodejs }:

with builtins;

stdenv.mkDerivation {
  pname = "china-ip-list-nft";

  version = builtins.readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  buildPhase = ''
    echo "define china_ip_list = {" >> china-ip-list.nft
    sed -r 's|(.*)|  \1,|' china_ip_list.txt >> china-ip-list.nft
    echo "}" >> china-ip-list.nft
  '';

  installPhase = ''
    cp china-ip-list.nft $out
  '';
}
