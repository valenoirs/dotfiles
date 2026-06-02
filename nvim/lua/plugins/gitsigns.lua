return {
	{
		"lewis6991/gitsigns.nvim",
		tag = "v1.0.2",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 500,
					virt_text_pos = "eol",
				},
			})
		end,
	},
}
