{inputs, ...}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];
  services.flatpak = {
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    remotes = [
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];
    packages = [
      { appId = "io.gitlab.librewolf-community"; origin = "flathub-beta"; }
    ];
  };
}
