{ config, lib, pkgs, ... }:

with lib;

let
  name = "smartdns-china-domain-list-updater";
  cfg = config.services.${name};
  lists = [ "accelerated-domains" "google" "apple" ];
  toCmd = list: ''
    ${pkgs.curl}/bin/curl https://cdn.jsdelivr.net/gh/felixonmars/dnsmasq-china-list/${list}.china.conf \
      | sed -r 's|server=/(.*)/114.114.114.114$|nameserver /\1/${cfg.group}|' > $STATE_DIRECTORY/${list}.conf
  '';
  script = pkgs.writeShellScript "get-china-domain-list" ''
    ${lib.concatMapStrings toCmd lists}
  '';
in {
  options = {
    services.${name} = {
      enable = mkEnableOption "SmartDNS chinese domain list updater";

      group = mkOption {
        type = types.str;
        default = "cn";
        description = ''
          The group/server which smartdns uses to query chinese domains
        '';
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
          RemainAfterExit = true;
          StateDirectory = name;
          ExecStart = script;
        };
      };
      services."${name}-restart" = {
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "/run/current-system/sw/bin/systemctl try-restart ${name}.service";
        };
      };
      timers."${name}-restart" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "*-*-* 04:00:00";
          Persistent = true;
        };
      };
    };
  };
}
