{ pkgs, ... }:

{
  services.geoclue2.appConfig = {
      "gammastep" = {
        isAllowed = true;
        isSystem = false;
        users = [ "1000" ]; # 'id -u "your_user_name"
      };
  };
  
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    # wlsunset
    gammastep
    brightnessctl
  ];
}
