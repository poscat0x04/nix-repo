{ lib, stdenv, pkgs, jq, autoPatchelfHook
, vscode-utils, rustc, rustPlatform
}:

with builtins;

let
  rustcSourcePath = "/build/rustc-${rustc.version}-src/src";
  rustLibSourcePath = "/build/rustc-${rustc.version}-src/library";
in
vscode-utils.buildVscodeMarketplaceExtension {
  vsix = fetchurl (fromJSON (readFile ./source.json));

  nativeBuildInputs = [
    autoPatchelfHook
    jq
  ];

  postPatch = ''
    cat <<< $(jq ".contributes.configuration.properties.\"lldb.launch.sourceMap\".default.\"${rustcSourcePath}\" = \"${rustPlatform.rustcSrc}\"\
                 |.contributes.configuration.properties.\"lldb.launch.sourceMap\".default.\"${rustLibSourcePath}\" = \"${rustPlatform.rustLibSrc}\""\
                 < package.json) > package.json
  '';

  mktplcRef = {
    publisher = "vadimcn";
    name = "vscode-lldb";
    version = readFile ./version;
  };
}
