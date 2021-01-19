{ vscode-utils, stdenv, ... }:

with stdenv.lib;
with builtins; with attrsets; with lists; with vscode-utils;

let
  extensions = fromJSON (readFile ./extensions.json);
  mergeList = foldr (x: xs: recursiveUpdate xs x) { };
  buildExt = extensionFromVscodeMarketplace;
in
  mergeList (map (ext: { "${ext.publisher}"."${ext.name}" = buildExt ext; }) extensions)

