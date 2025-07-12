{
  writeShellApplication,
  nushell,
  glib,
  gsettings-desktop-schemas,
}:

{
  getter = writeShellApplication {
    name = "get-appearance-module";
    runtimeInputs = [
      nushell
      glib
      gsettings-desktop-schemas
    ];
    text = # bash
      ''
        ${./get-appearance.nu}
      '';
  };
  setter = writeShellApplication {
    name = "set-appearance-module";
    runtimeInputs = [
      nushell
      glib
      gsettings-desktop-schemas
    ];
    text = # bash
      ''
        ${./set-appearance.nu}
      '';
  };
}
