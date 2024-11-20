local utils = require('utils')


local kopts = utils.keymap_opts_gen("Tree")


local function update_keymap()
  local api = require "nvim-tree.api"

  local function find_file()
    api.tree.find_file({ focus = true })
  end

  vim.keymap.set('n', '<leader>fs', api.tree.toggle, kopts('tree Structure'))
  vim.keymap.set('n', '<leader>fq', find_file, kopts('tree - Query & show file'))
  vim.keymap.set('n', '<leader>ft', api.tree.focus, kopts('tree - focus Tree'))
end


return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      renderer = {
        indent_markers = {
          enable = true
        }
      },
    }
    update_keymap()

  end,
}
