return {
  "nvim-treesitter-context",
  after = function()
    local tsc = require("treesitter-context")
    tsc.setup({
      enable = true,
      max_lines = 1,
    })
    Snacks.toggle({
      name = "[C]ode Treesitter [C]ontext",
      get = tsc.enabled,
      set = function(state)
        if state then
          tsc.enable()
        else
          tsc.disable()
        end
      end,
    }):map("<leader>cc")
  end,
}
