{ pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  nixpkgs.config.permittedInsecurePackages = [
   "electron-25.9.0"
  ];

    nixpkgs.overlays = [(
    final: prev: {
        wezterm = prev.wezterm.overrideAttrs (o: rec {
            src = prev.fetchFromGitHub {
              owner = "wez";
              repo = "wezterm";
              rev = "e3cd2e93d0ee5f3af7f3fe0af86ffad0cf8c7ea8";
              fetchSubmodules = true;
              sha256 = "sha256-sj3S1fWC6j9Q/Yc+4IpLbKC3lttUWFk65ROyCdQt+Zc=";
            };

            # creating an overlay for buildRustPackage overlay
            # https://discourse.nixos.org/t/is-it-possible-to-override-cargosha256-in-buildrustpackage/4393/3
            cargoDeps = prev.rustPlatform.importCargoLock {
              lockFile = src + "/Cargo.lock";
              allowBuiltinFetchGit = true;
            };
        });
    })
];  

  environment.systemPackages = with pkgs; [
    wezterm
    cool-retro-term

    starship
    helix
    vim
    obsidian

    qutebrowser
    firefox
    zathura
    mpv
    imv
    vscode
    arduino
    android-studio
  ];
}
