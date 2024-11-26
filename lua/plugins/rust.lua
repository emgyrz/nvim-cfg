vim.g.rustaceanvim = {

  tools = {
  },

  server = {
    on_attach = function(_client, bufnr)

      require('../config/lsp_keys')(bufnr)

      vim.keymap.set(
        "n",
        "<F4>",
        function()
          vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        end,
        { silent = false, buffer = bufnr }
      )
      vim.keymap.set(
        "n",
        "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
        function()
          vim.cmd.RustLsp({'hover', 'actions'})
        end,
        { silent = true, buffer = bufnr }
      )

    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}




return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
}
