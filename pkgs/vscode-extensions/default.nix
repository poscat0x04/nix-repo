{ stdenv, callPackage, lib, fetchurl, vscode-utils
, icu, curl, openssl, lttng-ust, autoPatchelfHook
, python3, musl, unzip
}:

with lib;
with builtins; with attrsets; with lists; with vscode-utils;

let
  extensions = fromJSON (readFile ./extensions.json);
  mergeList = foldr (x: xs: recursiveUpdate xs x) { };
  buildExt = extensionFromVscodeMarketplace;
in
  mergeList (map (ext: { "${ext.publisher}"."${ext.name}" = buildExt ext; }) extensions) // {
    ms-python.python = callPackage ./python {
      extractNuGet = callPackage ./python/extract-nuget.nix { };
    };
  }

