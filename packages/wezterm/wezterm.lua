local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.term = "wezterm"
config.default_prog = { "fish", "-l" }

config.font = wezterm.font("Maple Mono NF CN")
config.font_size = 18
config.color_scheme = "Tokyo Night"

config.window_decorations = "NONE"
config.tab_bar_at_bottom = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.disable_default_key_bindings = true
config.automatically_reload_config = true
config.keys = {
  {
    key = "q",
    mods = "ALT",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    key = "f",
    mods = "CTRL",
    action = wezterm.action.Search({ CaseSmartString = "" }),
  },
  {
    key = "e",
    mods = "ALT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "Quote",
    mods = "ALT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "j",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Next"),
  },
  {
    key = "h",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Prev"),
  },
  {
    key = "c",
    mods = "ALT",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "n",
    mods = "ALT",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "p",
    mods = "ALT",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "n",
    mods = "ALT|SHIFT",
    action = wezterm.action.MoveTabRelative(1),
  },
  {
    key = "p",
    mods = "ALT|SHIFT",
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = "c",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CopyTo("Clipboard"),
  },
  {
    key = "v",
    mods = "CTRL|SHIFT",
    action = wezterm.action.PasteFrom("Clipboard"),
  },
}

return config
