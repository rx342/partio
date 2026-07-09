{
  writeShellApplication,
  nushell,
  niri,
}:

writeShellApplication {
  name = "niri-kill-focused";
  runtimeInputs = [
    nushell
    niri
  ];
  text = # bash
    ''
      ${./kill-focused.nu} "$@"
    '';
}
