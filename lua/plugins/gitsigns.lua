local utils = require('utils')

local kopts = utils.keymap_opts_gen('Gitsigns')

return {
  'lewis6991/gitsigns.nvim',

  event = "VeryLazy",

  config = function ()
    require('gitsigns').setup{
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, desc)
          local opts = kopts(desc)
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end, 'move to the next hunk')

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end, 'move to the prev hunk')

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, 'stage hunk')
        map('n', '<leader>hr', gitsigns.reset_hunk, 'reset hunk')
        map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, 'stage hunk')
        map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, 'reset hunk')
        map('n', '<leader>hS', gitsigns.stage_buffer, 'stageb uffer')
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, 'undo stage hunk')
        map('n', '<leader>hR', gitsigns.reset_buffer, 'reset buffer')
        map('n', '<leader>hp', gitsigns.preview_hunk, 'preview hunk')
        map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, 'blame line')
        map('n', '<leader>hq', gitsigns.toggle_current_line_blame, 'toggle current line blame')
        map('n', '<leader>hd', gitsigns.diffthis, 'diff against the index')
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end, 'diff this')
        map('n', '<leader>hz', gitsigns.toggle_deleted, 'toggle deleted')

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'some selecting of hunk?')
      end
    }
  end
}
