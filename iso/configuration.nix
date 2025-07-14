{ lib, pkgs, ... }:

let
  inherit (import ../npins) lix lix-module;
  partio = import ../partio.nix { inherit (pkgs) system; };
in
{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    overlays = [ (import ../overlays/default.nix) ];
    config = {
      allowUnsupportedSystem = true;
      allowUnfree = true;
    };
  };

  documentation = {
    man.generateCaches = false;
    info.enable = false;
    doc.enable = false;
  };

  imports = [
    (import "${lix-module}/module.nix" { inherit lix; })
  ];

  environment.systemPackages = [
    partio
  ];

  users = {
    users = {
      soul = {
        description = "install user";
        isNormalUser = true;
        uid = 1000;
        home = "/home/soul";
        extraGroups = [ "wheel" ];
        shell = partio;
      };
    };
    mutableUsers = false;
  };

  services.getty.autologinUser = lib.mkForce "soul";

  services.openssh = {
    enable = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };

  time.timeZone = "Europe/Paris";
  console.keyMap = "fr";

  networking.hostName = "ether";

  system.stateVersion = "25.11";
}
