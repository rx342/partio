{ pkgs, ... }:

{
  wrappers.nushell = {
    basePackage = pkgs.nushell;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config"
      ./config.nu
    ];
    env.STARSHIP_CONFIG.value = ../starship/starship.toml;
    pathAdd = [
      pkgs.starship
      pkgs.fzf
      pkgs.nix-your-shell
    ];
  };
}
