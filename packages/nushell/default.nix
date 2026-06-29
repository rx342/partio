{ pkgs, ... }:

let
  nuscripts = (import ../../npins).nu_scripts.outPath;
  config =
    pkgs.writeText "config.nu"
      # nu
      ''
        source ${./config.nu}
        source ${nuscripts}/themes/nu-themes/tokyo-night.nu
        source ${./abbrv.nu}
        source ${./keybinds.nu}
        source ${./autoload.nu}
      '';
in
{
  wrappers.nushell = {
    basePackage = pkgs.nushell;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config"
      config
    ];
    env.STARSHIP_CONFIG.value = ../starship/starship.toml;
    pathAdd = [
      pkgs.starship
      pkgs.fzf
      pkgs.nix-your-shell
    ];
  };
}
