return {
	"akinsho/bufferline.nvim",
	tag = "v4.9.1",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim-lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Dictionary",
						separator = true,
					},
				},
			},
		})
	end,
}
