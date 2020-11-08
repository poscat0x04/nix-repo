{
  description = "Nix repo";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

  outputs = { self, nixpkgs, ... }:
  let
    supportedSystems = [ "x86_64-linux" ];
    forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; config.allowUnfree = true; });
  in
    {
      overlay = self: super: with self.pkgs; with self.lib; {
        vscode-insiders = callPackage ./pkgs/vscode-insiders { };
        vscode-insiders-with-extensions = super.vscode-with-extensions.override {
          vscode = vscode-insiders;
        };
        play-with-mpv = callPackage ./pkgs/play-with-mpv { };
        ttf-ms-win10 = callPackage ./pkgs/ttf-ms-win10 { zipListsWith = self.lib.zipListsWith; };
        prefs-cleaner = callPackage ./pkgs/arkenfox-userjs/prefs-cleaner.nix { };
        extra-files = {
          arkenfox-userjs = callPackage ./pkgs/arkenfox-userjs { };
          nord-alacritty = callPackage ./pkgs/nord-alacritty { };
          nord-dircolors = callPackage ./pkgs/nord-dircolors { };
          nord-konsole = callPackage ./pkgs/nord-konsole { };
        };
      };

      packages = forAllSystems (system:
        let
          pkgSet = nixpkgsFor.${system};
        in
        {
          inherit (pkgSet)
          vscode-insiders
          play-with-mpv
          ttf-ms-win10
          prefs-cleaner
          extra-files;
        });
    };
}
