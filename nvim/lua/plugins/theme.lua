-- make sure to set the priority to 1000 for it to load first
return {
	-- {
	-- 	"olivercederborg/poimandres.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("poimandres").setup({})
	-- 	end,
	--
	-- 	init = function()
	-- 		vim.cmd("colorscheme poimandres")
	-- 	end,
	-- },
	-- {
	--     "dgox16/oldworld.nvim",
	--     lazy = false,
	--     priority = 1000,
	--     init = function()
	--         require("oldworld").setup({
	--             terminal_colors = true,
	--             highlight_overrides = {
	--                 Normal = { bg = "NONE" },
	--                 NormalFloat = { bg = "NONE" },
	--                 EndOfBuffer = { bg = "NONE" },
	--                 SignColumn = { bg = "NONE" }, -- keeps the gutter transparent
	--                 LineNr = { bg = "NONE" }, -- keeps line numbers transparent
	--                 -- if you use telescope, you might want these transparent too
	--                 TelescopeNormal = { bg = "NONE" },
	--                 TelescopeBorder = { bg = "NONE" },
	--             },
	--         })
	--         vim.cmd.colorscheme("oldworld")
	--     end,
	-- },
	-- {
	--     "navarasu/onedark.nvim",
	--     priority = 1000,
	--     config = function()
	--         require("onedark").setup({
	--             style = "warmer",
	--         })
	--         require("onedark").load()
	--     end,
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = true,
	-- 	init = function()
	-- 		vim.o.background = "light"
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	{
		"nendix/zen.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			require("zen").setup({
				variant = "light", -- "dark", "light", or "auto" (follows vim.o.background)
				undercurl = true,
				transparent = true,
				dimInactive = false,
				terminalColors = true,
				commentStyle = { italic = false },
				functionStyle = {},
				keywordStyle = { italic = false },
				statementStyle = {},
				typeStyle = {},
				compile = false,
				colors = {
					palette = {}, -- override palette colors
					theme = {}, -- override theme colors
				},
				overrides = function(colors)
					return {}
				end,
			})

			vim.cmd.colorscheme("zen")
		end,
	},
}
