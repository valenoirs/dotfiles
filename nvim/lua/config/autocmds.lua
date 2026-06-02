local jdtls_grp = vim.api.nvim_create_augroup("jdtls_lsp", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	group = jdtls_grp,
	callback = function()
		require("config.jdtls").setup_jdtls()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.keymap.set("n", "<CR>", "<CR><Cmd>cclose<CR>", { buffer = true, silent = true })
		vim.keymap.set("n", "q", "<Cmd>cclose<CR>", { buffer = true, silent = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "make",
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})

local save_prompt_group = vim.api.nvim_create_augroup("EasyToChangePrompt", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = save_prompt_group,
	pattern = "*",
	callback = function()
		vim.schedule(function()
			vim.api.nvim_echo({
				{
					'Are you sure this decision is "Easy to Change" in the future? Think again. But, if you are so sure, then alright!',
					"Question",
				},
			}, false, {})
		end)
	end,
	desc = "Show maintainability question after saving",
})
