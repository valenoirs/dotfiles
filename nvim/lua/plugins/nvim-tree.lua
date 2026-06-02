return {
	"nvim-tree/nvim-tree.lua",
	tag = "v1.14.0",
	config = function()
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })
		require("nvim-tree").setup({
			hijack_netrw = true,
			auto_reload_on_write = true,
			filters = {
				git_ignored = false,
				dotfiles = false,
			},
			view = {
				side = "right",
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
				change_dir = {
					enable = false,
					restrict_above_cwd = true,
				},
			},
			update_focused_file = {
				enable = true,
			},
		})
	end,
}
