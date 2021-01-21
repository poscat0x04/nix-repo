{ lib, stdenv, pkgs, codelldb, jq, makeWrapper
, lldb, python3, vscode-utils, rustc, rustPlatform
}:

with builtins;

let
  sourcePath = "/build/rustc-${rustc.version}-src/src/";
in
vscode-utils.buildVscodeMarketplaceExtension {
  vsix = fetchurl (fromJSON (readFile ./source.json));

  nativeBuildInputs = [
    makeWrapper
    jq
  ];

  postPatch = ''
    rm adapter/{codelldb,libcodelldb.so}
    ln -s ${codelldb}/bin/codelldb adapter/codelldb
    ln -s ${codelldb}/lib/libcodelldb.so adapter/libcodelldb.so
    rm -r lldb
    ln -s ${lldb} lldb

    wrapProgram adapter/codelldb \
      --prefix PATH : "${python3}/bin" \
      --prefix LD_LIBRARY_PATH : "${python3}/lib"

    cat <<< $(jq ".contributes.configuration.properties.\"lldb.launch.sourceMap\".default.\"${sourcePath}\" = \"${rustPlatform.rustcSrc}\"" < package.json) > package.json
  '';

  mktplcRef = {
    publisher = "vadimcn";
    name = "vscode-lldb";
    version = readFile ./version;
  };
}
