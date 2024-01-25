{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.adb.enable = true;
  users.users.knutnix= {
    isNormalUser = true;
    description = "knutnix";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" "adbusers" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      spotify
      youtube-music
      discord
      tdesktop
      vscode
      brave
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
