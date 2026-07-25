local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Shim for deprecated Neovim 0.10+ LSP API
if not vim.lsp.get_active_clients then
  vim.lsp.get_active_clients = vim.lsp.get_clients
end

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local opts = {
	change_detection = {
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
}

require("config.options")
require("config.keymaps")
require("config.autocmds")
-- require("config.colorscheme")
require("utils")
require("custom.custom")
require("lazy").setup("plugins", opts)
