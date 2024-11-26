return {
  'rmagatti/auto-session',
  lazy = false,

  config = function ()
    require('auto-session').setup {

      pre_save_cmds = {
        -- "tabdo NvimTreeClose",
      },

      post_restore_cmds = {
        -- "someOtherVimCommand",
        function()
          -- Restore nvim-tree after a session is restored
          local nvim_tree_api = require('nvim-tree.api')
          nvim_tree_api.tree.change_root(vim.fn.getcwd())
          nvim_tree_api.tree.find_file({
            focus = false,
            open = true,
          })
          nvim_tree_api.tree.reload()
        end
      },
    }
  end
}
