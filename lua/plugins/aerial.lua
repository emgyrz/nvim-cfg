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
        vim.keymap.set("n", "[[", "<cmd>AerialPrev<CR>", kopts("Jump backwards", bufnr))
        vim.keymap.set("n", "]]", "<cmd>AerialNext<CR>", kopts("Jump forwards", bufnr))
        vim.keymap.set("n", "<leader>fa", "<cmd>AerialToggle<CR>", kopts("AerialToggle"))
      end,
    })
  end,

}

