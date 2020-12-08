{ vscode-utils, stdenv, wakatime, ... }:

with stdenv.lib;
with builtins; with attrsets; with lists; with vscode-utils;

let
  extensions = fromJSON (readFile ./extensions.json);
  mergeList = foldr (x: xs: recursiveUpdate xs x) { };
  buildExt =
    ext: if ext.name == "vscode-wakatime"
         then buildVscodeMarketplaceExtension {
                mktplcRef = ext;
                postPatch = ''
                  mkdir -p wakatime-cli
                  ln -s ${wakatime}/bin/wakatime wakatime-cli/wakatime-cli
                '';
              }
         else extensionFromVscodeMarketplace ext;
in
  mergeList (map (ext: { "${ext.publisher}"."${ext.name}" = buildExt ext; }) extensions)

