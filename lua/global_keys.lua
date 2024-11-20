local utils = require('utils')


local kopts = utils.keymap_opts_gen("Global")


vim.api.nvim_set_keymap('n', '<leader>ao', 'o<Esc>', kopts("add empty line after current"))
vim.api.nvim_set_keymap('n', '<leader>aO', 'O<Esc>', kopts("add empty line before current"))
vim.api.nvim_set_keymap('n', '<leader>a;', 'm6g_a;<Esc>`6', kopts("add a semicolon to the end of line"))
vim.api.nvim_set_keymap('n', '<leader>a,', 'm6g_a,<Esc>`6', kopts("add a comma to the end of line"))


-- vim.keymap.set('n', ']t', '<Cmd>tabnext<CR>', kopts("switch to the next tab"))
-- vim.keymap.set('n', '[t', '<Cmd>tabprev<CR>', kopts("switch to the prev tab"))


vim.keymap.set('n', ']b', '<Cmd>bnext<CR>', kopts('switch to the next buffer'))
vim.keymap.set('n', '[b', '<Cmd>bprevious<CR>', kopts('switch to the prev buffer'))


local function close_buff()

  local i = utils.get_bufs_count()

  if i == 0 then
    return
  elseif i == 1 then
    vim.cmd "w | q"
  else
    vim.cmd "w | bp | bd#"
  end

end


vim.keymap.set('n', '<leader>fx', close_buff, kopts("wtite, close buffer and open previous"))

