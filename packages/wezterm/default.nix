{ pkgs, ... }:

{
  wrappers.wezterm = {
    basePackage = pkgs.wezterm;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    env.WEZTERM_CONFIG_FILE = {
      value =
        pkgs.writeText "wezterm.lua"
          # lua
          ''
            local wezterm = require("wezterm")
            local config = wezterm.config_builder()

            dofile("${./init.lua}").apply_to_config(config)
            dofile("${./tokyonight.lua}").apply_to_config(config)

            return config
          '';
      force = true;
    };
  };
}
