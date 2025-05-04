{ pkgs, lib, config, ... }: {
  options = {
    postgresql.enable = lib.mkEnableOption "Enable Postgresql Database";
  };

  config = lib.mkIf config.postgresql.enable {
    services.postgresql = {
      enable = true;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
        
        # Allow IPv6 localhost connections
        host  all       all     ::1/128       trust

        # Allow IPv4 localhost connections 
        host  all       all     127.0.0.1/32  trust
      '';
    };
  };
}
