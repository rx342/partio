{
  system ? builtins.currentSystem,
  source ? import ./npins,
}:

let
  evalModules = import "${source.nixpkgs}/nixos/lib/eval-config.nix";
  mkMachine =
    modules:
    (evalModules {
      inherit modules;
    });
in
mkMachine [
  "${source.nixpkgs}/nixos/modules/virtualisation/qemu-vm.nix"
  ./configuration.nix
  ./vm.nix
  {
    system.activationScripts.wallpaperSymlink.text =
      # bash
      ''
        mkdir -p /home/soul/.local/share/wallpapers
        chown -R soul /home/soul/.local
        ln -sfn ${source.wallpkgs}/wallpapers/catppuccin/catppuccin-cat-in-clouds.png /home/soul/.local/share/wallpapers/home.png
        ln -sfn ${source.wallpkgs}/wallpapers/catppuccin/catppuccin-cat-in-clouds.png /home/soul/.local/share/wallpapers/lockscreen.png
      '';
  }
  (
    { pkgs, lib, ... }:
    {
      nixpkgs = {
        hostPlatform = system;
        overlays = [ (import "${source.partio}/overlays/default.nix") ];
        config = {
          allowUnfree = true;
        };
      };

      nix.settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };

      system.stateVersion = "25.11";

      documentation = {
        man.generateCaches = false;
        info.enable = false;
        doc.enable = false;
      };

      users = {
        users = {
          soul = {
            description = "virtual soul";
            isNormalUser = true;
            uid = 1000;
            home = "/home/soul";
            extraGroups = [ "wheel" ];
            shell = pkgs.rx342.fish;
            password = "soul";
          };
        };
        mutableUsers = false;
      };

      networking.hostName = "ether";

      services.getty.autologinUser = lib.mkForce "soul";

      time.timeZone = "Europe/Paris";
    }
  )
]
