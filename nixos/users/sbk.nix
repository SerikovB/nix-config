{ inputs, config, pkgs, ... }:
let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.defaultUserShell = pkgs.zsh;
  users.users.sbk = {
    isNormalUser = true;
    shell = pkgs.zsh;
    packages = [ pkgs.home-manager ];
    extraGroups = [ "wheel" "video" "audio" ]
      ++ ifTheyExist [ "networkmanager" "git" "libvirtd" ];
    openssh.authorizedKeys.keys = [
      "../../home-manager/sbk/id_ed25519.pub"
    ];
    hashedPasswordFile = "/etc/passwords/sbk";
  };
  # home-manager.users.sbk = import ../../home-manager/sbk/${config.networking.hostName}.nix;
}
