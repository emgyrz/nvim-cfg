local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  -- config = true, 
  opts = {

  },
  config = function()
    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme gruvbox]])
  end,
}


local tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme tokyonight-storm]])
    -- vim.cmd([[colorscheme tokyonight-day]])
    -- vim.cmd([[colorscheme tokyonight]])
  end,
}


return {
  gruvbox,
}
