return {
	{
		"mason-org/mason.nvim",
		tag = "v2.1.0",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		tag = "v2.1.0",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"jdtls",
					"ts_ls",
					"postgres_lsp",
					"dockerls",
					"docker_compose_language_service",
					"yamlls",
					"gopls",
				},
				automatic_enable = {
					exclude = {
						"jdtls",
					},
				},
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		tag = "v2.5.2",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "java-debug-adapter", "java-test", "js-debug-adapter" },
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"delve",
					"eslint_d",
					"gofumpt",
					"goimports",
					"golangci-lint",
					"hadolint",
					"pgformatter",
					"prettier",
					"stylua",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"neovim/nvim-lspconfig",
		tag = "v2.5.0",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", { capabilities = capabilities })

			-- Lua
			vim.lsp.config("lua_ls", {})
			vim.lsp.enable("lua_ls")

			-- Go
			vim.lsp.config("gopls", require("config.gopls"))
			vim.lsp.enable("gopls")

			-- Postgres
			vim.lsp.config("postgres_lsp", {})
			vim.lsp.enable("postgres_lsp")

			-- Keymap
			vim.keymap.set("n", "grh", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
			vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
			vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })

			-- restarts all active lsp clients for the current buffer
			vim.keymap.set("n", "gG", function()
				vim.cmd("LspRestart")
				print("LSP Restarted")
			end, { desc = "Restart LSP" })
		end,
	},
}
