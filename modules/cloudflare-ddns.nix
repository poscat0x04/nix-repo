{ lib, pkgs, config, ... }:

with lib;

let
  name = "cloudflare-ddns";
  cfg = config.services.${name};
  config-file = pkgs.writeText "${name}-config.toml" ''
    [config]
    name = "${cfg.domain}"
    iface = "${cfg.interface}"
    zone_id = "${cfg.zoneId}"
    dualstack = ${boolToString cfg.dualstack}
    proxied = ${boolToString cfg.proxied}
    ttl = ${builtins.toString cfg.ttl}

    [credential]
    token = "${cfg.token}"
  '';
in
{
  options = {
    services.${name} = {
      enable = mkEnableOption ''
        cloudflare DDNS service
      '';

      domain = mkOption {
        type = types.str;
        description = ''
          The domain name to update
        '';
      };

      interface = mkOption {
        type = types.str;
        description = ''
          The name of the interface to read addresses from
        '';
      };

      zoneId = mkOption {
        type = types.str;
        description = ''
          The zone identifier of the zone the domain belongs to.
        '';
      };

      dualstack = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to update the AAAA record
        '';
      };

      proxied = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to resolve this domain to cloudflare CDN servers
        '';
      };

      ttl = mkOption {
        type = types.int;
        default = 120;
        description = ''
          The TTL of the record to create
        '';
      };

      token = mkOption {
        type = types.str;
        description = ''
          The API token for authentication
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    systemd = {
      services.${name} = {
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.${name}}/bin/cloudflare-ddns -c ${config-file}";
          Restart = "always";
          RestartPreventExitStatus = [ 17 18 19 ];
        };
      };
    };
  };
}
