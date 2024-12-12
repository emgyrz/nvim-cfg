local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
}

M.config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if luasnip.expandable() then
            luasnip.expand()
          else
            cmp.confirm({
              select = true,
            })
          end
        else
          fallback()
        end
      end),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.locally_jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      -- { name = "orgmode" },
    }, {
        { name = "buffer" },
        { name = "path" },
      }
    ),
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
        { name = "cmdline" },
      }),
  })




  local on_attach = function (client, bufnr)
    require('../config/lsp_keys')(bufnr)
  end

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  require'lspconfig'.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }



  require'lspconfig'.ts_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      completions = {
        -- completeFunctionCalls = true,
      },
    },
  }

  require'lspconfig'.eslint.setup{
    capabilities = capabilities,
    on_attach = on_attach,
  }

  require'lspconfig'.emmet_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
  }

  require'lspconfig'.lua_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'}
        }
      }
    }
  }

  require'lspconfig'.clangd.setup{
    capabilities = capabilities,
    on_attach = on_attach,
  }


end

return M
