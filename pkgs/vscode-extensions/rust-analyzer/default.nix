{ vscode-utils, jq, rust-analyzer }:

with builtins;

vscode-utils.buildVscodeMarketplaceExtension {
  nativeBuildInputs = [
    jq
  ];

  preInstall = ''
    cat <<< $(jq '.contributes.configuration.properties."rust-analyzer.serverPath".default = $s'\
                 --arg s "${rust-analyzer}/bin/rust-analyzer" < package.json) > package.json
  '';

  mktplcRef = fromJSON (readFile ./rust-analyzer.json);
}
