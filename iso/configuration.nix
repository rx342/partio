{ lib, pkgs, ... }:

let
  partio = import ../partio.nix { inherit (pkgs) system; };
in
{
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    channel = {
      enable = false;
    };
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
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ16Q6HeQQ5xm9ss4ITLd0Me31/qmIM++yC1lIkXyc6z"
        ];
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

  isoImage = {
    makeUsbBootable = true;
  };
}
