{ vscode-utils, attrsets, lists, ... }:

with builtins; with attrsets; with lists; with vscode-utils;

let
  extensions = fromJSON (readFile ./extensions.json);
  mergeList = foldr (x: xs: recursiveUpdate xs x) { };
in
  mergeList (map (ext: { "${ext.publisher}"."${ext.name}" = extensionFromVscodeMarketplace ext; }) extensions)

