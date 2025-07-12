{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    rx342.htop
    rx342.bat
    rx342.eza
    rx342.git
    rx342.tmux
    rx342.neovim
    rx342.rofi-wayland
    rx342.rofi-translate
    rx342.rofi-power-menu
    rx342.rofi-monitor
    rx342.fcitx5
    (lib.warn "This virtual machine uses `pkgs.rx342.sway` to avoid artifacts but ideally you should use `pkgs.rx342.swayfx`." rx342.sway)
    rx342.waybar
    rx342.swaylock
    rx342.neovim
    rx342.wezterm
    bemoji
    bibata-cursors
    nix-output-monitor
    zoxide
    yazi
    spotify
    direnv
    numbat
  ];

  fonts.packages = with pkgs; [
    inter
    maple-mono.NF
    jost
    nerd-fonts.jetbrains-mono
  ];

  environment.variables = {
    WLR_RENDERER_ALLOW_SOFTWARE = 1;
    WLR_RENDERER = "pixman";
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "sway";
        user = "soul";
      };
    };
  };
}
