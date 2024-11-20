local utils = require('utils')

local kopts = utils.keymap_opts_gen("Diffview")


return {
  'sindrets/diffview.nvim',
  event = "VeryLazy",

  config = function ()
    vim.api.nvim_set_keymap('n', '<leader>hw', '<Cmd>DiffviewOpen<CR>', kopts("open"))
    vim.api.nvim_set_keymap('n', '<leader>hW', '<Cmd>DiffviewClose<CR>', kopts("close"))
  end
}
