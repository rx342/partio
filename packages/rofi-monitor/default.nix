{
  writeShellApplication,
  nushell,
}:

writeShellApplication {
  name = "rofi-monitor";
  runtimeInputs = [
    nushell
  ];
  text = # bash
    ''
      ${./rofi-monitor.nu}
    '';
}
