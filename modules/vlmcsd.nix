{ lib, pkgs, config, ... }:

with lib;

let
  cfg = config.services.vlmcsd;
in {
  options.services.vlmcsd = {
    enable = mkEnableOption ''
      vlmcsd KMS service
    '';

    package = mkOption {
      type = types.package;
      default = pkgs.vlmcsd;
      description = ''
        The vlmcsd package to use
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.vlmcsd = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        SystemCallFilter = [ "@system-service" "~@privileged @resources" ];
        SystemCallArchitectures = "native";
        RestrictAddressFamilies = [ "AF_INET" "AF_INET6" ];
        RestrictNamespaces = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        MemoryDenyWriteExecute = true;
        ProtectHome = true;
        ProtectSystem = "strict";
        PrivateDevices = true;
        PrivateUsers = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectControlGroups = true;
        DevicePolicy = "closed";
        DynamicUser = true;
        ExecStart = "${cfg.package}/bin/vlmcsd -D";
      };
    };
  };
}
