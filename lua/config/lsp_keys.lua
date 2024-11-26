local utils = require('utils')
local kopts = utils.keymap_opts_gen("LSP")

return function(bufnr)

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', kopts("Displays hover information about the symbol under the cursor", bufnr))

  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', kopts("Jump to the definition", bufnr))

  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', kopts("Jump to declaration", bufnr))

  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', kopts("Lists all the implementations for the symbol under the cursor", bufnr))

  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', kopts("Jumps to the definition of the type symbol", bufnr))

  vim.keymap.set('n', 'gr', '<cmd>:Telescope lsp_references<cr>', kopts("Lists all the references ", bufnr))

  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', kopts("Displays a function's signature information", bufnr))

  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', kopts("Renames all references to the symbol under the cursor", bufnr))

  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', kopts("Selects a code action available at the current cursor position", bufnr))

  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', kopts("Show diagnostics in a floating window", bufnr))

  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', kopts("Move to the previous diagnostic", bufnr))

  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', kopts("Move to the next diagnostic", bufnr))

end

