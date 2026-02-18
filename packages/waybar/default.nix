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
        dnd-module = pkgs.callPackage ../dnd-module/default.nix { };
      in
      [
        appearance-module.getter
        appearance-module.setter
        dnd-module.getter
        dnd-module.setter
        coreutils-full
      ];
  };
}
