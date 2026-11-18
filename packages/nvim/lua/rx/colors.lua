_G.rx = _G.rx or {}

local map_to_light = {
  ["catppuccin-mocha"] = "catppuccin-latte",
  ["tokyonight-moon"] = "tokyonight-day",
}

local bg_colorschemes = {}

local colorschemes = {}
for k, _ in pairs(map_to_light) do
  table.insert(colorschemes, k)
end

for _, v in ipairs(bg_colorschemes) do
  table.insert(colorschemes, v)
end

local function random_colorscheme()
  math.randomseed(os.time())
  rx.colorscheme = colorschemes[math.random(#colorschemes)]
  vim.cmd.colorscheme(rx.colorscheme)
end

random_colorscheme()

local map_to_dark = {}
for k, v in pairs(map_to_light) do
  map_to_dark[v] = k
end

function rx.color_toggle(colorscheme)
  colorscheme = colorscheme or rx.colorscheme
  if rx.has_value(bg_colorschemes, colorscheme) then
    local background = vim.opt.background:get()
    if background == "dark" then
      vim.opt.background = "light"
    else
      vim.opt.background = "dark"
    end
  else
    rx.colorscheme = map_to_light[colorscheme] or map_to_dark[colorscheme] or ""
    vim.cmd.colorscheme(rx.colorscheme)
  end
end
