return {
	"mistweaverco/kulala.nvim",
	tag = "v6.21.0",
	ft = { "http", "rest" },
	opts = {},
	keys = {
		{
			"R",
			function()
				require("kulala").run()
			end,
			desc = "Send HTTP request",
		},
		{
			"rt",
			function()
				require("kulala").toggle_view()
			end,
			desc = "Toggle HTTP response view",
		},
		{
			"rc",
			function()
				require("kulala").copy()
			end,
			desc = "Copy as cURL",
		},
	},
}
