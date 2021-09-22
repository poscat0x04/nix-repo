{ fetchgit
, python3Packages
}:

let
  inherit (builtins) readFile fromJSON;
  inherit (python3Packages)
  buildPythonPackage
  ctypescrypto
  fleep
  ifaddr
  libarchive-c
  netifaces
  pillow
  requests
  requests-toolbelt
  zeroconf;
in buildPythonPackage rec {
  pname = "opendrop";

  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  doCheck = false;

  propagatedBuildInputs = [
    ctypescrypto
    fleep
    ifaddr
    libarchive-c
    netifaces
    pillow
    requests
    requests-toolbelt
    zeroconf
  ];
}
