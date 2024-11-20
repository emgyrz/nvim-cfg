return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },

  config = function ()
    local dap = require('dap')

    -- dap.adapters.firefox = {
    --   type = 'executable',
    --   command = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/firefox-debug-adapter',
    --   args = {''},
    -- }

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "3000",
      executable = {
        command = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/js-debug-adapter',
        args = {'3000'},
      }
    }


    local js_based_langs = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }

    for _, lang in ipairs(js_based_langs) do
      dap.configurations[lang] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
    end


    require("dapui").setup()
  end,
}


