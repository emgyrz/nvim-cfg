vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
      local bufnr = vim.api.nvim_get_current_buf()
      vim.keymap.set(
        "n", 
        "<leader>la", 
        function()
          vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
          -- or vim.lsp.buf.codeAction() if you don't want grouping.
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