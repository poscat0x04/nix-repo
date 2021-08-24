{ lib, pkgs, config, ... }:

with lib;

let
  name = "nftables-china-ip-list-updater";
  cfg = config.services.${name};

  setOptions = {
    options = {
      family = mkOption {
        default = "ip";
        type = types.enum [ "ip" "ip6" "inet" ];
        description = ''
          the address family of the table
        '';
      };

      table = mkOption {
        type = types.str;
        description = ''
          name of the table
        '';
      };

      set = mkOption {
        type = types.str;
        description = ''
          name of the set
        '';
      };
    };
  };

  gen-update-command = {family, table, set}: let
    nft-script = pkgs.writeText "${family}-${table}-${set}.nft" ''
      include "/var/lib/${name}/china-ip-list.nft"
      add element ${family} ${table} ${set} $china_ip_list
    '';
  in ''
    if ${pkgs.nftables}/bin/nft flush set ${family} ${table} ${set}; then
      ${pkgs.nftables}/bin/nft -f ${nft-script}
    else
      echo '\033[0;31mset ${set} does not exist in table "${family} ${table}"\033[0m'
    fi
  '';

  script = pkgs.writeShellScript "update-china-ip-list" ''
    echo "define china_ip_list = {" >> /tmp/china-ip-list.nft
    ${pkgs.curl}/bin/curl https://cdn.jsdelivr.net/gh/17mon/china_ip_list/china_ip_list.txt \
      | sed -r 's|(.*)|  \1,|'      >> /tmp/china-ip-list.nft
    echo ""                         >> /tmp/china-ip-list.nft
    echo "}"                        >> /tmp/china-ip-list.nft
    mv /tmp/china-ip-list.nft $STATE_DIRECTORY/china-ip-list.nft

    ${concatMapStrings gen-update-command cfg.sets}
  '';
in {
  options = {
    services.${name} = {
      enable = mkEnableOption ''
        nftables china ip list updater
      '';

      sets = mkOption {
        default = [ ];
        type = types.listOf (types.submodule setOptions);
      };
    };
  };

  config = mkIf cfg.enable {
    systemd = {
      services.${name} = {
        after = [ "network-online.target" ];
        requires = [ "network-online.target" ];
        serviceConfig = {
          Type = "oneshot";
          PrivateTmp = true;
          StateDirectory = name;
          ExecStart = script;
        };
      };

      timers.${name} = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "*-*-* 04:00:00";
          Persistent = true;
        };
      };
    };
  };
}
