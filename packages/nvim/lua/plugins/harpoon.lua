return {
  "harpoon",
  keys = {
    {
      "<leader>hh",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "list",
    },
    {
      "<leader>hn",
      function()
        require("harpoon"):list():add()
      end,
      desc = "add",
    },
    {
      "<leader>ha",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "1",
    },
    {
      "<leader>hz",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "2",
    },
    {
      "<leader>he",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "3",
    },
    {
      "<leader>hr",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "4",
    },
    {
      "<leader>ht",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "5",
    },
    {
      "<leader>hy",
      function()
        require("harpoon"):list():select(6)
      end,
      desc = "6",
    },
  },
}
