# 👜 Partio

This is a subset of my dotfiles that is public.
This serves two purposes:

- I do not want to share all of my dotfiles since I may leak secrets, but still want to share some stuff
- I can use this as a **portable** config: since everything is wrapped I can just invoke it with `nix` and have my minimal config everywhere

You can try it with

```bash
nix run github:rx342/partio
```

Note that because everything is packaged, your configuration files should not be altered in any way!

Since it is _personal_, it has some very opinionated options and should only be used temporarily (unless you want to have my identity and stuff on your computer).
You can also check my wrapped `nvim` config: [rx342/nvim](https://github.com/rx342/nvim).

## Credits

- [viperML/wrapper-manager](https://github.com/viperML/wrapper-manager)
- [viperML/dotfiles](https://github.com/viperML/dotfiles)
- [sioodmy/andromeda](https://github.com/sioodmy/andromeda/tree/main)
