{
  writeShellApplication,
  rofi-power-menu,
}:

writeShellApplication {
  name = "rofi-power-menu";
  runtimeInputs = [
    rofi-power-menu
  ];
  text = # bash
    ''
      rofi -show power-menu -modi power-menu:rofi-power-menu
    '';
}
