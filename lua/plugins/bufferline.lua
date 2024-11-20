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

  end,
}
