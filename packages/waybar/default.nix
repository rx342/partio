{ pkgs, ... }:

{
  wrappers.waybar = {
    basePackage = pkgs.waybar;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config=${./config}"
      "--style=${./style.css}"
    ];
    pathAdd =
      with pkgs;
      let
        appearance-module = pkgs.callPackage ../appearance-module/default.nix { };
        power-profile-module = pkgs.callPackage ../power-profile-module/default.nix { };
      in
      [
        (pkgs.callPackage ../spotify-module/default.nix { })
        appearance-module.getter
        appearance-module.setter
        power-profile-module.getter
        power-profile-module.setter
        coreutils-full
      ];
  };
}
