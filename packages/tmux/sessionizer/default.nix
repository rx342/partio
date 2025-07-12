{
  writeShellApplication,
  nushell,
}:

writeShellApplication {
  name = "sessionizer";
  runtimeInputs = [
    nushell
  ];
  text = # bash
    ''
      ${./sessionizer.nu} "$@"
    '';
}
