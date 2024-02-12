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

  environment.persistence."/persist" = {
    users.sbk = {
      directories = [
        "desktop"
        "documents"
        "downloads"
        "music"
        "notes"
        "pictures"
        "projects"
        "public"
        "templates"
        "videos"
        { directory = ".var"; mode = "0700"; }
        { directory = ".gnupg"; mode = "0700"; }
        { directory = ".ssh"; mode = "0700"; }
        { directory = ".local/share/keyrings"; mode = "0700"; }
        { directory = ".local/state/nix"; mode = "0700"; }
        { directory = ".local/state/home-manager"; mode = "0700"; }
        ".local/share/direnv"
      ];
    };
  };


  # home-manager.users.sbk = import ../../home-manager/sbk/${config.networking.hostName}.nix;
}
