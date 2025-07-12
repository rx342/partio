{ pkgs, ... }:

{
  wrappers.zk = {
    basePackage = pkgs.zk;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    env = {
      ZK_NOTEBOOK_DIR.value = "${builtins.getEnv "HOME"}/zk_notes";
      XDG_CONFIG_HOME = {
        value = ./.;
        force = true;
      };
    };
  };
}
