{ pkgs, ... }:

let
  inherit (pkgs) lib;
  nuscripts = (import ../../npins).nu_scripts.outPath;
  plugins = with pkgs.nushellPlugins; [
    polars
  ];
  msgPackz = pkgs.runCommand "nushellMsgPackz" { } ''
    mkdir -p "$out"
    ${pkgs.nushell}/bin/nu \
      --plugin-config "$out/plugin.msgpackz" \
      --commands '${
        lib.concatStringsSep "; " (map (plugin: "plugin add ${lib.getExe plugin}") plugins)
      }'
  '';
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
      "--plugin-config"
      "${msgPackz}/plugin.msgpackz"
    ];
    env.STARSHIP_CONFIG.value = ../starship/starship.toml;
    pathAdd = [
      pkgs.starship
      pkgs.fzf
      pkgs.nix-your-shell
    ];
  };
}
