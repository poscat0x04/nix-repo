{ config, lib, pkgs, ... }:

with lib;

let
  name = "smartdns-china-domain-list-updater";
  cfg = config.services.${name};
  lists = [ "accelerated-domains" "google" "apple" ];
  toCmd = list: ''
    ${pkgs.curl}/bin/curl --doh-url https://101.6.6.6:8443/dns-query https://cdn.jsdelivr.net/gh/felixonmars/dnsmasq-china-list/${list}.china.conf \
      | sed -r 's|server=/(.*)/114.114.114.114$|nameserver /\1/${cfg.group}|' > /tmp/${list}.conf
  '';
  toMv = list: ''
    mv /tmp/${list}.conf $STATE_DIRECTORY/${list}.conf
  '';
  script = pkgs.writeShellScript "get-china-domain-list" ''
    set -e
    set -o pipefail
    ${lib.concatMapStrings toCmd lists}
    ${lib.concatMapStrings toMv lists}
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
          PrivateTmp = true;
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
