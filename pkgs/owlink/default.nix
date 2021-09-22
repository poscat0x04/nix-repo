{ stdenv
, fetchgit
, libnl
, libpcap
, libev
, cmake
}:

with builtins;

stdenv.mkDerivation {
  pname = "owlink";

  version = readFile ./version;

  src = fetchgit (fromJSON (readFile ./source.json));

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    libnl
    libpcap
    libev
  ];
}
