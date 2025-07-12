{ pkgs, ... }:

{
  wrappers.git = {
    basePackage = pkgs.git;
    env.GIT_CONFIG_GLOBAL.value = pkgs.writeText "config" ''
      ${builtins.readFile ./config}

      [core]
      excludesFile = "${./ignore}"
    '';
    pathAdd = with pkgs; [ delta ];
  };
}
