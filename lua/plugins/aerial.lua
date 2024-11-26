local utils = require('utils')
local kopts = utils.keymap_opts_gen("Aerial")

return {
  'stevearc/aerial.nvim',

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },

  config = function ()
    require("aerial").setup({
      on_attach = function(bufnr)
        vim.keymap.set("n", "[[", "<cmd>AerialPrev<CR>", kopts("jump backwards", bufnr))
        vim.keymap.set("n", "]]", "<cmd>AerialNext<CR>", kopts("jump forwards", bufnr))
        vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle<CR>", kopts("aerial toggle"))
        vim.keymap.set("n", "<leader>af", "<cmd>AerialOpen<CR>", kopts("aerial open or focus"))
        vim.keymap.set("n", "<leader>an", "<cmd>AerialNavOpen<CR>", kopts("aerial float nav open"))
        vim.keymap.set("n", "<leader>at", "<cmd>Telescope aerial<CR>", kopts("aerial in telescope"))
      end,

      keymaps = {
        ["o"] = "actions.jump",
      },

      nav = {
        keymaps = {
          ["<C-[>"] = "actions.close",
        },
      },

    })
  end,

}

