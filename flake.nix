{
  description = "Nix repo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    NUR.url = "github:nix-community/NUR";
    flake-utils.url = "github:poscat0x04/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "/nixpkgs";
    };
  };

  outputs = { self, nixpkgs, NUR, flake-utils, rust-overlay, ... }: with flake-utils;
    {
      overlay = self: super: with self; {
        play-with-mpv = callPackage ./pkgs/play-with-mpv { };
        ttf-ms-win10 = callPackage ./pkgs/ttf-ms-win10 { };
        prefs-cleaner = callPackage ./pkgs/arkenfox-userjs/prefs-cleaner.nix { };
        extra-files = {
          arkenfox-userjs = callPackage ./pkgs/arkenfox-userjs { };
          nord-alacritty = callPackage ./pkgs/nord-alacritty { };
          nord-dircolors = callPackage ./pkgs/nord-dircolors { };
          nord-konsole = callPackage ./pkgs/nord-konsole { };
          nginx-fancyindex-flat-theme = callPackage ./pkgs/nginx-fancyindex-flat-theme { };
        };
        firefox-addons = callPackages ./pkgs/firefox-addons { };
        vscode-extensions = super.vscode-extensions // callPackage ./pkgs/vscode-extensions { };
        fcitx5-material-color = callPackage ./pkgs/fcitx5-material-color { };
        unbound-china-domain-list = callPackage ./pkgs/unbound-china-domain-list { };
        vlmcsd = callPackage ./pkgs/vlmcsd { };
        nginxModules = super.nginxModules // {
          http-digest-auth = callPackage ./pkgs/nginx-http-auth-digest { };
        };
        lttng-ust-compat = lttng-ust.overrideAttrs (_: {
          postInstall = "ln -s $out/lib/liblttng-ust.so.1.0.0 $out/lib/liblttng-ust.so.0";
        });
        wolfram-engine = callPackage ./pkgs/wolfram-engine { };
      };

      nixosModules = {
        vlmcsd = import ./modules/vlmcsd.nix;
      };
    } // eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ NUR.overlay rust-overlay.overlay self.overlay ]; config.allowUnfree = true; };
      in
      {
        packages =
          {
            inherit (pkgs)
              play-with-mpv
              ttf-ms-win10
              prefs-cleaner
              extra-files
              firefox-addons
              vscode-extensions
              fcitx5-material-color
              unbound-china-domain-list
              vlmcsd
              python3Packages
              jhwhw-tex
              nginxModules
              lttng-ust-compat
              wolfram-engine
              ;
              inherit (pkgs) discord;
          };
        devShell = with pkgs; with nur.repos.rycee; mkShell {
          buildInputs = [
            curl
            jq
            nix-prefetch-scripts
            nixUnstable

            # for generating nix expressions for firefox addons
            mozilla-addons-to-nix

            # for vscode extension update script
            python3
            python3Packages.requests
            python3Packages.pyyaml
            python3Packages.libversion
            python3Packages.packaging
          ];
        };
      }
    );
}
