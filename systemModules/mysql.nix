{ pkgs, lib, config, ... }: {
  options = {
    mysql.enable = lib.mkEnableOption "Enable MySql Database Management System";
  };

  config = lib.mkIf config.mysql.enable {
    environment.systemPackages = [ pkgs.mysql-workbench ];
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };
}
