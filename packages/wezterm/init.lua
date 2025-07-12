local M = {}

function M.apply_to_config(config)
  local wezterm = require("wezterm")

  config.default_prog = { "fish", "-l" }

  config.font = wezterm.font("Maple Mono NF", { weight = "Light" })
  config.font_size = 18

  config.window_decorations = "NONE"
  config.term = "wezterm"
  config.enable_tab_bar = false
  config.hide_mouse_cursor_when_typing = false
  config.cursor_blink_rate = 0

  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }

  config.mux_enable_ssh_agent = false
end

return M
