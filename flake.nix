{
  description = "Nix repo";

  inputs = {
    nixpkgs.url = github:poscat0x04/nixpkgs/dev;
    NUR.url = github:nix-community/NUR;
    flake-utils.url = github:poscat0x04/flake-utils;
    rust-overlay = {
      url = github:oxalica/rust-overlay;
      inputs.nixpkgs.follows = "/nixpkgs";
    };
  };

  outputs = { self, nixpkgs, NUR, flake-utils, rust-overlay, ... }: with flake-utils;
    {
      overlay = self: super: with self; {
        vscode-insiders = callPackage ./pkgs/vscode-insiders { };
        vscode-insiders-with-extensions = super.vscode-with-extensions.override {
          vscode = vscode-insiders;
        };
        play-with-mpv = callPackage ./pkgs/play-with-mpv { };
        ttf-ms-win10 = callPackage ./pkgs/ttf-ms-win10 { };
        prefs-cleaner = callPackage ./pkgs/arkenfox-userjs/prefs-cleaner.nix { };
        extra-files = {
          arkenfox-userjs = callPackage ./pkgs/arkenfox-userjs { };
          nord-alacritty = callPackage ./pkgs/nord-alacritty { };
          nord-dircolors = callPackage ./pkgs/nord-dircolors { };
          nord-konsole = callPackage ./pkgs/nord-konsole { };
          v2ray-rules-dat = {
            geoip-dat = callPackage ./pkgs/v2ray-rules-dat/geoip.nix { };
            geosite-dat = callPackage ./pkgs/v2ray-rules-dat/geosite.nix { };
          };
          nginx-fancyindex-flat-theme = callPackage ./pkgs/nginx-fancyindex-flat-theme { };
        };
        firefox-addons = callPackages ./pkgs/firefox-addons { };
        vscode-extensions = super.vscode-extensions // callPackage ./pkgs/vscode-extensions { };
        fcitx5-material-color = callPackage ./pkgs/fcitx5-material-color { };
        standardnotes = callPackage ./pkgs/standard-notes { };
        china-ip-list-nft = callPackage ./pkgs/china-ip-list-nft { };
        unbound-china-domain-list = callPackage ./pkgs/unbound-china-domain-list { };
        vlmcsd = callPackage ./pkgs/vlmcsd { };
        owlink = callPackage ./pkgs/owlink { };
        opendrop = callPackage ./pkgs/opendrop { };
        python3Packages = with self.python3Packages; super.python3Packages // {
          ctypescrypto = callPackage ./pkgs/python-ctypescrypto { };
          fleep = callPackage ./pkgs/python-fleep { };
        };
        jhwhw-tex = { pkgs = [ (callPackage ./pkgs/jhwhw-tex { }) ]; };
        cloudflare-ddns = callPackage ./pkgs/cloudflare-ddns { };
        nginxModules = super.nginxModules // {
          http-digest-auth = callPackage ./pkgs/nginx-http-auth-digest { };
        };
        lttng-ust-compat = lttng-ust.overrideAttrs (_: {
          postInstall = "ln -s $out/lib/liblttng-ust.so.1.0.0 $out/lib/liblttng-ust.so.0";
        });
        wolfram-engine = callPackage ./pkgs/wolfram-engine { };
      };

      nixosModules = {
        smartdns-china-domain-list-updater = import ./modules/smartdns-china-domain-list-updater.nix;
        nftables-china-ip-list-updater = import ./modules/nftables-china-ip-list-updater.nix;
        vlmcsd = import ./modules/vlmcsd.nix;
        cloudflare-ddns = import ./modules/cloudflare-ddns.nix;
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
              vscode-insiders
              play-with-mpv
              ttf-ms-win10
              prefs-cleaner
              extra-files
              firefox-addons
              vscode-extensions
              fcitx5-material-color
              standardnotes
              china-ip-list-nft
              unbound-china-domain-list
              vlmcsd
              owlink
              opendrop
              python3Packages
              jhwhw-tex
              cloudflare-ddns
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
            firefox-addons-generator

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
