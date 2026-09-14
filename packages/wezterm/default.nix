{ pkgs, ... }:

{
  wrappers.wezterm = {
    basePackage = pkgs.wezterm;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config-file=${./wezterm.lua}"
    ];
  };
}
