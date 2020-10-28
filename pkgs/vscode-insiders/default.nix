{ fetchurl, vscode }:

(vscode.override {
    isInsiders = true;
}).overrideAttrs (
  _: rec {
    pname = "vscode-insiders";
    version = builtins.readFile ./version;

    src = fetchurl (builtins.fromJSON (builtins.readFile ./source.json));
  }
)
