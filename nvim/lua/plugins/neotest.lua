return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"fredrikaverpil/neotest-golang",
		"rcasia/neotest-java",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-golang")({
					go_test_args = {
						"-v",
						-- "-race",
						"-count=1",
					},
					-- env = { CGO_ENABLED = "1"},
					dap_go_enabled = true,
				}),
				require("neotest-java")({
					ignore_wrapper = false,
				}),
				status = { virtual_text = true },
				output = { open_on_run = true },
			},
		})
	end,
	keys = {
		-- equivalent to "run test" (nearest to cursor)
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			desc = "Run Nearest",
		},
		-- equivalent to "debug test"
		{
			"<leader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug Nearest",
		},
		-- equivalent to "run file test"
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run File",
		},
		-- run the current package (directory of the current file)
		{
			"<leader>tp",
			function()
				require("neotest").run.run(vim.fn.expand("%:p:h"))
			end,
			desc = "Run Package",
		},
		-- run the entire test suite (entire project)
		{
			"<leader>tw",
			function()
				require("neotest").run.run(vim.fn.getcwd())
			end,
			desc = "Run Entire Suite",
		},
		-- show the visual test tree (the "clickable" ui)
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Test Summary",
		},
		-- hover over a failed test to see why
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true })
			end,
			desc = "Test Output",
		},
	},
}
