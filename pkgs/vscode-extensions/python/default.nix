{ lib, stdenv, fetchurl, vscode-utils, extractNuGet
, icu, curl, openssl, lttng-ust-compat, autoPatchelfHook
, python3, musl
}:

with builtins;
let
  pyls = fromJSON (readFile ./pyls.json);
  vscode-python = fromJSON (readFile ./vscode-python.json);
  languageServer = extractNuGet rec {
    name = "Python-Language-Server";
    version = pyls.version;

    src = fetchurl {
      inherit (pyls) url sha256;
    };
  };
in vscode-utils.buildVscodeMarketplaceExtension rec {
  mktplcRef = vscode-python;

  buildInputs = [
    icu
    curl
    openssl
    lttng-ust-compat
    musl
  ];

  nativeBuildInputs = [
    autoPatchelfHook
    python3.pkgs.wrapPython
  ];

  pythonPath = with python3.pkgs; [
    setuptools
  ];

  postInstall = ''
    mkdir -p "$out/$installPrefix/languageServer.${languageServer.version}"
    cp -R --no-preserve=ownership ${languageServer}/* "$out/$installPrefix/languageServer.${languageServer.version}"
    chmod -R +wx "$out/$installPrefix/languageServer.${languageServer.version}"

    patchPythonScript "$out/$installPrefix/pythonFiles/lib/python/isort/main.py"
  '';

  meta = with lib; {
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
}
