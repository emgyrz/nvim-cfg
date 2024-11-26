local utils = require('utils')
local kopts = utils.keymap_opts_gen("Tree")

local function update_keymap()
  local api = require "nvim-tree.api"

  local function find_file()
    api.tree.find_file({
      focus = true,
      open = true,
    })

    vim.cmd.normal('w')
    -- vim.cmd.normal('zs')
  end

  vim.keymap.set('n', '<leader>fs', api.tree.toggle, kopts('tree Structure'))
  vim.keymap.set('n', '<leader>fq', find_file, kopts('tree - Query & show file'))
  vim.keymap.set('n', '<leader>ft', api.tree.focus, kopts('tree - focus Tree'))
end


return {
  "nvim-tree/nvim-tree.lua",
  version = "*",

  -- because of auto-session
  lazy = true,

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      filters = {
        custom = {"^.git$"}
      },

      git = {
        timeout = 777
      },

      view = {
        centralize_selection = true,
        -- adaptive_size = true
      },

      renderer = {
        full_name = true,
        indent_markers = {
          -- enable = true
        }
      },

    }
    update_keymap()

  end,
}
