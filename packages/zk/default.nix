{ pkgs, ... }:

{
  wrappers.zk = {
    basePackage = pkgs.zk;
    env = {
      ZK_NOTEBOOK_DIR.value = "~/zk_notes";
      XDG_CONFIG_HOME = {
        value = ./.;
        force = true;
      };
    };
  };
}
