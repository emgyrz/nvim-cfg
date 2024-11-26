local utils = require('utils')
local kopts = utils.keymap_opts_gen("Bufferline")

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',

  options = {
    always_show_bufferline = true,
  },

  config = function()
    local bline = require('bufferline')
    bline.setup{
      options = {
        separator_style = 'slope'
      }
    }

    vim.keymap.set('n', ']b', '<Cmd>BufferLineCycleNext<CR>', kopts('switch to the next buffer'))
    vim.keymap.set('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', kopts('switch to the prev buffer'))

    vim.api.nvim_set_keymap('n', '<leader>bc', '<Cmd>BufferLineCloseOthers<CR>', kopts("close other buffers"))
    vim.api.nvim_set_keymap('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', kopts("close right buffers"))
    vim.api.nvim_set_keymap('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', kopts("close left buffers"))
    vim.api.nvim_set_keymap('n', '<leader>bm', '<Cmd>BufferLineMoveNext<CR>', kopts("move right"))
    vim.api.nvim_set_keymap('n', '<leader>bp', '<Cmd>BufferLineMovePrev<CR>', kopts("move left"))

  end,
}
