return {
  "yazi.nvim",
  after = function()
    require("yazi").setup({
      keymaps = {
        show_help = false,
        open_file_in_vertical_split = false,
        open_file_in_horizontal_split = false,
        open_file_in_tab = false,
        grep_in_directory = false,
        replace_in_directory = false,
        cycle_open_buffers = false,
        copy_relative_path_to_selected_files = false,
        send_to_quickfix_list = "<c-q>",
        change_working_directory = "<c-w>",
        open_and_pick_window = false,
      },
    })
  end,
  keys = {
    { "<leader>yy", "<cmd>Yazi<cr>", desc = "[Y]azi" },
    { "<leader>yc", "<cmd>Yazi cwd<cr>", desc = "[Y]azi [c]wd" },
  },
}
