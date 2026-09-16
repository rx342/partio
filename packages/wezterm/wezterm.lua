local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.term = "wezterm"
config.default_prog = { "fish", "-l" }

config.font = wezterm.font("Maple Mono NF CN")
config.font_size = 18
config.color_scheme = "Tokyo Night"
config.inactive_pane_hsb = {
  brightness = 0.5,
}

config.window_decorations = "NONE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 1,
}

config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.colors = {
  tab_bar = {
    background = "#16161e",
    active_tab = {
      bg_color = "#222436",
      fg_color = "#82aaff",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#16161e",
      fg_color = "#636da6",
      italic = true,
    },
  },
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

wezterm.on("update-right-status", function(window, pane)
  local cwd_uri = pane:get_current_working_dir()
  local host = cwd_uri.host or wezterm.hostname()
  window:set_right_status(wezterm.format({
    { Attribute = { Italic = true } },
    { Foreground = { AnsiColor = "Yellow" } },
    { Text = host },
  }))
end)

return config
