return {
	"mistweaverco/kulala.nvim",
	tag = "v6.21.0",
	ft = { "http", "rest" },
	opts = {},
	keys = {
		{
			"<leader>rr",
			function()
				require("kulala").run()
			end,
			desc = "Run HTTP request",
		},
		{
			"<leader>rt",
			function()
				require("kulala").toggle_view()
			end,
			desc = "Toggle headers/body",
		},
		{
			"<leader>rp",
			function()
				require("kulala").jump_prev()
			end,
			desc = "Jump to previous request",
		},
		{
			"<leader>rn",
			function()
				require("kulala").jump_next()
			end,
			desc = "Jump to next request",
		},
	},
}
