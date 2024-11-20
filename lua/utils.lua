local api = vim.api;

local M = {}

local get_listed_bufs = function()
    return vim.tbl_filter(function(bufnr)
       return api.nvim_buf_get_option(bufnr, "buflisted")
    end, api.nvim_list_bufs())
end


M.get_bufs_count = function()

  local i = 0

  for k,v in pairs(get_listed_bufs()) do
      i = i + 1
  end

  return i
end



M.keymap_opts_gen = function(mod)
  local function gen(desc, bufnr)
    return { desc = mod .. ": " .. desc, noremap = true, silent = true, buffer = bufnr }
  end
  return gen
end


return M
