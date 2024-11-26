local opt = vim.opt

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.relativenumber = false
opt.number = true

-- высота строки для ввода комманд
opt.cmdheight = 2

opt.tabstop = 2 -- insert 2 spaces for a tab
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.expandtab = true -- convert tabs to spaces

opt.linespace = 11

opt.wrap = false


opt.ignorecase = true
opt.smartcase = true


opt.cursorline = true -- highlight the current line


opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"


-- минимальное количество линий до края окна
opt.scrolloff = 3 -- vertical
opt.sidescrolloff = 3 -- horizontal

-- отключает swapfile, нужный для восстановления после сбоя
opt.swapfile = false

-- enable persistent undo
opt.undofile = true
opt.undodir = "/tmp/vim_undodir"


vim.g['mapleader'] = " "


vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0


local space = "·"
opt.listchars:append {
	tab = "│─",
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space
}
opt.list = true

