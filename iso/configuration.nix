{ lib, pkgs, ... }:

let
  partio = import ../partio.nix { inherit (pkgs) system; };
in
{
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    overlays = [
      (import ../overlays/default.nix)
      (final: prev: {
        inherit (prev.lixPackageSets.stable)
          nixpkgs-review
          nix-eval-jobs
          nix-fast-build
          colmena
          ;
      })
    ];
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
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
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

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";
  console.keyMap = "fr";

  networking.hostName = "ether";

  system.stateVersion = "25.11";
}
