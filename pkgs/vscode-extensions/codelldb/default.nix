{ autoPatchelfHook, zlib, vscode-utils }:

with builtins;

vscode-utils.buildVscodeMarketplaceExtension {
  vsix = fetchurl (fromJSON (readFile ./source.json));

  nativeBuildInputs = [
    autoPatchelfHook
    zlib
  ];

  mktplcRef = {
    publisher = "vadimcn";
    name = "vscode-lldb";
    version = readFile ./version;
  };
}
