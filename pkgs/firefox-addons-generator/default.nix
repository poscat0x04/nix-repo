{ aeson, base-noprelude, directory, fetchgit, hnix, lib, microlens-aeson
, microlens-platform, mkDerivation, relude, text, wreq }:

mkDerivation rec {
  pname = "nixpkgs-firefox-addons";
  version = "0.8.0";
  src = fetchgit {
    url = "https://gitlab.com/Poscat0x04/nixpkgs-firefox-addons";
    rev = "63bf602876059e7a73d4c190a3e72f7bf7059e09";
    sha256 = "1vr4wcn002kgc4q6pji101khlwv9l70ph9nkmii77zqq332hkb2l";
    fetchSubmodules = false;
    deepClone = false;
    leaveDotGit = false;
  };
  isLibrary = false;
  isExecutable = true;
  enableSeparateDataOutput = true;
  executableHaskellDepends = [
    aeson
    base-noprelude
    directory
    hnix
    microlens-aeson
    microlens-platform
    relude
    text
    wreq
  ];
  homepage = "https://gitlab.com/rycee/nix-firefox-addons";
  description = "Tool generating a Nix package set of Firefox addons";
  license = lib.licenses.gpl3;
}
