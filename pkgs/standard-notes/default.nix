{ lib, stdenv, appimageTools, autoPatchelfHook, desktop-file-utils
, fetchurl, libsecret, gtk3, gsettings-desktop-schemas }:

let
  version = builtins.readFile ./version;
  pname = "standardnotes";

  src = fetchurl (builtins.fromJSON (builtins.readFile ./source.json));

  appimageContents = appimageTools.extract {
    inherit src;

    name = pname;
  };

  nativeBuildInputs = [ autoPatchelfHook desktop-file-utils ];

in appimageTools.wrapType2 rec {
  inherit src;

  name = pname;

  profile = ''
    export XDG_DATA_DIRS=${gsettings-desktop-schemas}/share/gsettings-schemas/${gsettings-desktop-schemas.name}:${gtk3}/share/gsettings-schemas/${gtk3.name}:$XDG_DATA_DIRS
  '';

  extraPkgs = pkgs: with pkgs; [
    libsecret
  ];

  extraInstallCommands = ''
    # directory in /nix/store so readonly
    cp -r  ${appimageContents}/* $out
    cd $out
    chmod -R +w $out

    # fixup and install desktop file
    ${desktop-file-utils}/bin/desktop-file-install --dir $out/share/applications \
      --set-key Exec --set-value ${pname} standard-notes.desktop

    rm usr/lib/* AppRun standard-notes.desktop .so*
  '';

  meta = with lib; {
    description = "A simple and private notes app";
    longDescription = ''
      Standard Notes is a private notes app that features unmatched simplicity,
      end-to-end encryption, powerful extensions, and open-source applications.
    '';
    homepage = "https://standardnotes.org";
    license = licenses.agpl3;
    platforms = [ "x86_64-linux" ];
  };
}
