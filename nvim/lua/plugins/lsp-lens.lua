return {
	"VidocqH/lsp-lens.nvim",
	event = "LspAttach",
	config = function()
		require("lsp-lens").setup({
			enable = true,
			include_declaration = false,
			hide_zero_counts = true,
			sections = {
				definition = false,
				references = true,
				implements = true,
			},
		})
	end,
}
