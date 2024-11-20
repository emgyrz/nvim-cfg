return {
  'nvim-lualine/lualine.nvim',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'stevearc/aerial.nvim',
  },

  config = function()
    require('lualine').setup({
      sections = {
        -- можно удалять
        lualine_c = { "aerial" },
      },
    })
  end,
}
