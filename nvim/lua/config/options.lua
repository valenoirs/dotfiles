local o = vim.opt
local g = vim.g
local c = vim.cmd

o.number = true
o.numberwidth = 2
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 20
o.sidescrolloff = 20

o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true
o.breakindent = true

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
o.backup = false
o.clipboard = "unnamedplus"
o.conceallevel = 0
o.fileencoding = "utf-8"
-- o.mouse = ""
o.showmode = false
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 1000
o.undofile = true
o.updatetime = 500
o.writebackup = false
o.cursorline = true

o.hlsearch = true
o.ignorecase = true
o.smartcase = true
