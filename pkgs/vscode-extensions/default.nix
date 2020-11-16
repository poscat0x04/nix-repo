{ vscode-utils, attrsets, ... }:

with builtins; with attrsets; with vscode-utils;

let
  extensions = fromJSON (readFile ./extensions.json);
in
  listToAttrs (map (ext: nameValuePair ext.publisher { "${ext.name}" = extensionFromVscodeMarketplace ext; }) extensions)

