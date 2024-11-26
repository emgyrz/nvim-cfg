return {
  'mfussenegger/nvim-jdtls',

  dependencies = {
    -- "neovim/nvim-lspconfig",
    -- "hrsh7th/cmp-nvim-lsp",
    -- "mfussenegger/nvim-dap",
    -- 'nvim-java/nvim-java',
  },

  ft = { "java" },

  config = function ()

    local jdtls_setup = require("jdtls.setup")

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = os.getenv('HOME') .. '/.cache/jdtls/workspace/' .. project_name

    local capabilities = require('cmp_nvim_lsp').default_capabilities();
    capabilities.workspace = {
      configuration = true
    }

    local config = {
      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

      cmd = {
        os.getenv('HOME') .. '/.local/share/nvim/mason/packages/jdtls/bin/jdtls',
        '-data', workspace_dir,
        '-test-opt', '3'
      },

      flags = {
        allow_incremental_sync = true,
      },


      capabilities = capabilities,

      -- Here you can configure eclipse.jdt.ls specific settings
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
      settings = {
        java = {
          references = {
            includeDecompiledSources = true,
          },
          signatureHelp = { enabled = true },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
        }
      },

      on_attach = function (client, bufnr)
        jdtls_setup.add_commands()
        require('../config/lsp_keys')(bufnr)
      end,


    }


    config.on_init = function(client, _)
      client.notify('workspace/didChangeConfiguration', { settings = config.settings })
    end

    local extendedClientCapabilities = require 'jdtls'.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    config.init_options = {
      -- bundles = bundles,
      extendedClientCapabilities = extendedClientCapabilities,
    }


    require('jdtls').start_or_attach(config)

    vim.api.nvim_create_autocmd({"BufWinEnter"}, {
      pattern = {"*.java"},
      callback = function(ev)
        -- print(string.format('event fired: %s', vim.inspect(ev)))
        require('jdtls').start_or_attach(config)
      end
    })


  end,
}
