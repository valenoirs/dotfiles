vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!"<CR>')

-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "[W]indow Split [H]orizontal" })
vim.keymap.set("n", "<leader>sV", ":vsplit #<CR>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>sH", ":split #<CR>", { desc = "[W]indow Split [H]orizontal" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "[T]ab [N]ew" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "[T]ab [C]lose" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous Tab" })

vim.keymap.set("n", "<leader>fD", vim.diagnostic.open_float, { desc = "Full Diagnostic" })

vim.keymap.set("n", "<leader>{", function()
	vim.cmd([[normal! A {}]])
end)

vim.keymap.set("n", "<leader>;", function()
	vim.cmd([[normal! A;]])
end)

vim.keymap.set("n", "<leader>bd", ":Bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bD", ":Bdelete!<CR>", { desc = "Force Delete buffer" })

vim.keymap.set("n", "<leader>bad", ":%bdelete<CR>", { desc = "Delete all buffer" })
vim.keymap.set("n", "<leader>baD", ":%bdelete!<CR>", { desc = "Force Delete all buffer" })

vim.keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "Create Empty Buffer" })

-- resize with Alt + hjkl
vim.keymap.set("n", "<M-k>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<M-j>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<M-h>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<M-l>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
