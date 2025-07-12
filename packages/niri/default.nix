{ pkgs, ... }:

{
  wrappers.niri = {
    basePackage = pkgs.niri;
    env.NIRI_CONFIG = {
      value = ./config.kdl;
    };
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    pathAdd = with pkgs; [
      playerctl
      swaybg
      (pkgs.callPackage ./dynamic-cast/default.nix { })
    ];
  };
}
