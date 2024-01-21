{ pkgs, ... }:

{
  # USB Automounting
  services.gvfs.enable = true;
  # services.udisks2.enable = true;
  # services.devmon.enable = true;

  # Enable USB Guard
  services.usbguard = {
    enable = true;
    dbus.enable = true;
    implicitPolicyTarget = "block";
# lsusb from usbutils package
    rules = ''
      allow id {1d6b:0002} # Linux Foundation 2.0 root hub
      allow id {1d6b:0003} # Linux Foundation 3.0 root hub
      allow id {1d6b:0002} # Linux Foundation 2.0 root hub
      allow id {046d:c548} # Logitech, Inc. Logi Bolt Receiver
      allow id {13d3:5271} # IMC Networks Integrated RGB Camera
      allow id {06cb:00f9} # Synaptics, Inc.
      allow id {8087:0032} # Intel Corp. AX210 Bluetooth
      allow id {1d6b:0003} # Linux Foundation 3.0 root hub
      allow id {0951:16df} # Kingston Technology HyperX QuadCast
      allow id {2341:0043} # Arduino SA Uno R3 (CDC ACM)

    '';
  };

  # Enable USB-specific packages
  environment.systemPackages = with pkgs; [
    usbutils
  ];
}
