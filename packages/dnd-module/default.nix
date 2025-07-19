{
  writeShellApplication,
  nushell,
}:

{
  getter = writeShellApplication {
    name = "get-dnd-module";
    runtimeInputs = [
      nushell
    ];
    text = # bash
      ''
        ${./dnd.nu} --get
      '';
  };
  setter = writeShellApplication {
    name = "set-dnd-module";
    runtimeInputs = [
      nushell
    ];
    text = # bash
      ''
        ${./dnd.nu} --toggle
      '';
  };
}
