# Nixos-config
❄️ My nixos configuration for laptop!

❄️ Regular installer download!
❄️ `nix-shell -p vim git ripgrep usbutils --run fish`
❄️ `rg --hidden 'knutnix'` and `rg --hidden 'nixos'`
❄️ Set usb ids in `/etc/nixos/usb.nix`
❄️ Enable flakes [NIXOS-FLAKES](https://nixos.wiki/wiki/Flakes) and build the system before building from flake
❄️ Check `/bootloader.nix` for efiSysMountPoint, mine is set to just /boot
❄️ `sudo nixos-rebuild switch --flake /etc/nixos#nixos`

Inspired by:
- [XNM](https://github.com/XNM1)
- [IogaMaster](https://github.com/IogaMaster)
- [iynaix](https://github.com/iynaix)
And everyone in the community for helping me: [Vimjoyer-discord-server](https://discord.gg/k6EjAw6m)
