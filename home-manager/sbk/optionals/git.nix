# git version control system
{ pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Serikov Bakhyt";
    userEmail = "serikovbk0@gmail.com";
  };
}
