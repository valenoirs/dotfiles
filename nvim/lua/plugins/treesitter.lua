return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		-- tag = "v0.10.0",
		lazy = false,
		build = ":TSUpdate",
		config = function(_, opts)
			require("nvim-treesitter").install({
				"lua",
				"markdown",
				"markdown_inline",
				"java",
				"yaml",
				"xml",
				"sql",
				"json",
				"groovy",
				"dockerfile",
				"bash",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"make",
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
				desc = "Enable Treesitter highlighting and indent",
				callback = function(args)
					local buf = args.buf
					local ft = vim.bo[buf].filetype
					local lang = vim.treesitter.language.get_lang(ft) or ft

					if pcall(vim.treesitter.query.get, lang, "highlights") then
						pcall(vim.treesitter.start, buf, lang)
					end

					if pcall(vim.treesitter.query.get, lang, "indents") then
						vim.bo[buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		tag = "v1.0.0",
		branch = "master",
		config = function()
			require("treesitter-context").setup()
		end,
	},
}
