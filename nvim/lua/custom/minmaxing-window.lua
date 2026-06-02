local tab_state = {}

function ToggleMaximize()
	local tab = vim.api.nvim_get_current_tabpage()

	tab_state[tab] = tab_state[tab] or { zoomed = false, layout = {} }

	if not tab_state[tab].zoomed then
		tab_state[tab].layout = {}
		for _, w in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
			tab_state[tab].layout[w] = {
				width = vim.api.nvim_win_get_width(w),
				height = vim.api.nvim_win_get_height(w),
			}
		end

		vim.cmd("wincmd _ | wincmd |")

		tab_state[tab].zoomed = true
	else
		for w, size in pairs(tab_state[tab].layout) do
			if vim.api.nvim_win_is_valid(w) then
				vim.api.nvim_win_set_width(w, size.width)
				vim.api.nvim_win_set_height(w, size.height)
			end
		end

		tab_state[tab].zoomed = false
	end
end

vim.keymap.set("n", "<leader>z", ToggleMaximize, { noremap = true, silent = true, desc = "Toggle Maximize Window" })
