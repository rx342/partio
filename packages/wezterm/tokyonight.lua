local M = {}

function M.apply_to_config(config)
  config.colors = {
    foreground = "#787c99",
    background = "#16161e",
    cursor_bg = "#787c99",
    cursor_fg = "#16161e",
    selection_fg = "#16161e",
    selection_bg = "#787c99",
    scrollbar_thumb = "#16161e",
    split = "#1a1b26",
    ansi = {
      "#16161e",
      "#f7768e",
      "#41a6b5",
      "#e0af68",
      "#7aa2f7",
      "#bb9af7",
      "#7dcfff",
      "#787c99",
    },
    brights = {
      "#444b6a",
      "#f7768e",
      "#41a6b5",
      "#e0af68",
      "#7aa2f7",
      "#bb9af7",
      "#7dcfff",
      "#d5d6db",
    },
    compose_cursor = "#cbccd1",
  }
end

return M
