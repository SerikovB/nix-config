{ config, pkgs, ... }:
let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.defaultUserShell = pkgs.zsh;
  users.users.sbk = {
    isNormalUser = true;
    initialPassword = "changeme";
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [ ];
    packages = [ pkgs.home-manager ];
    extraGroups = [ "wheel" "video" "audio" ]
      ++ ifTheyExist [ "networkmanager" "git" "libvirtd" ];
  };
}
