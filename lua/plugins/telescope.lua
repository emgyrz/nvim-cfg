return {
  'nvim-telescope/telescope.nvim',

  branch = '0.1.x',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },

  mappings = {
    n = {
      -- ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
      -- ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
    }
  },

  config = function()
    local action_state = require 'telescope.actions.state'
    local actions = require("telescope.actions")


    require('telescope').setup{
      defaults = {
        initial_mode = 'normal',
        mappings = {
          n = {
            ["p"] = function(prompt_bufnr)
              local current_picker = action_state.get_current_picker(prompt_bufnr)
              local text = vim.fn.getreg('"')
              current_picker:set_prompt(text, false)
            end,
            ["<C-y>"] = function()
              local entry = require("telescope.actions.state").get_selected_entry()
              local cb_opts = vim.opt.clipboard:get()
              if vim.tbl_contains(cb_opts, "unnamed") then vim.fn.setreg("*", entry.path) end
                vim.print(entry.path)
                vim.print(entry)
              if vim.tbl_contains(cb_opts, "unnamedplus") then
                vim.fn.setreg("+", entry.path)
              end
              vim.fn.setreg("", entry.path)
            end,
          },
        },

        layout_config = {
          width = 0.95
        },
      },
      pickers = {
        live_grep = {
          initial_mode = 'insert'
        },
        help_tags = {
          initial_mode = 'insert'
        },
        find_files = {
          initial_mode = 'insert'
        },
        oldfiles = {
          cwd_only = true,
        },
        lsp_references = {
          path_display = {
            -- shorten = 2
            "tail"
          }
        },
        buffers = {
          mappings = {
            n = {
              ['<c-d>'] = actions.delete_buffer
            }, -- n
            i = {
              ['<c-d>'] = actions.delete_buffer
            } -- i
          },
        },

      },


      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        },
      },
    }


    require('telescope').load_extension('ui-select')


    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fe', builtin.oldfiles, { desc = 'Telescope oldfiles' })
    vim.keymap.set('n', '<leader>fc', builtin.git_status, { desc = 'Telescope git status' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Telescope resume' })
    vim.keymap.set('n', '<leader>fp', '<Cmd>SessionSearch<CR>', { desc = 'Telescope sessions search' })
  end,
}
