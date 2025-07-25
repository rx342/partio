{ pkgs, ... }:

{
  wrappers.fcitx5 = {
    basePackage = pkgs.libsForQt5.fcitx5-with-addons.override {
      addons = with pkgs; [
        fcitx5-unikey
        fcitx5-chinese-addons
      ];
    };
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    env = {
      XDG_CONFIG_HOME = {
        value = ./config;
        force = true;
      };
      XDG_DATA_HOME = {
        value = ./share;
        force = true;
      };
      GLFW_IM_MODULE.value = "ibus";
      SDL_IM_MODULE.value = "fcitx";
      XMODIFIERS.value = "@im=fcitx";
    };
  };
}
