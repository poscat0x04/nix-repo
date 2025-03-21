{
  description = "Nix repo";

  inputs = {
    nixpkgs.url = "github:poscat0x04/nixpkgs/dev";
    flake-utils.url = "github:poscat0x04/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: with flake-utils;
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
        unbound-china-domain-list = callPackage ./pkgs/unbound-china-domain-list { };
        vlmcsd = callPackage ./pkgs/vlmcsd { };
        nginxModules = super.nginxModules // {
          http-digest-auth = callPackage ./pkgs/nginx-http-auth-digest { };
        };
        wolfram-engine = callPackage ./pkgs/wolfram-engine { };
        cf-mtls-cert = builtins.fetchurl {
          url = "https://developers.cloudflare.com/ssl/static/authenticated_origin_pull_ca.pem";
          sha256 = "0hxqszqfzsbmgksfm6k0gp0hsx9k1gqx24gakxqv0391wl6fsky1";
        };
        ciel = callPackage ./pkgs/ciel { };
        aosc-findupdate = callPackage ./pkgs/aosc-findupdate { };
        abbs-update-checksum = callPackage ./pkgs/abbs-update-checksum { };
      };

      nixosModules = {
        vlmcsd = import ./modules/vlmcsd.nix;
      };
    } // eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ self.overlay ]; config.allowUnfree = true; };
      in
      {
        packages =
          {
            inherit (pkgs)
              play-with-mpv
              ttf-ms-win10
              prefs-cleaner
              extra-files
              unbound-china-domain-list
              vlmcsd
              python3Packages
              jhwhw-tex
              nginxModules
              wolfram-engine
              cf-mtls-cert
              ciel
              aosc-findupdate
              abbs-update-checksum
              ;
            inherit (pkgs) discord;
          };
        devShell = with pkgs; mkShell {
          buildInputs = [
            curl
            jq
            nix-prefetch-scripts
            nix
            nix-init
            nurl
          ];
        };
      }
    );
}
