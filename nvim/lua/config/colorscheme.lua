-- Reset existing highlighting
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

-- Define your "Book" palette (explicitly text only)
local black = "#000000"
local gray = "#7C6F64"
local green = "#396847"
local red = "#c82829"
local yellow = "#f5871f"
local blue = "#4271ae"

-- Structural UI (Forcing completely transparent background "NONE")
vim.api.nvim_set_hl(0, "Normal", { fg = black, bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = black, bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = gray, bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = black, bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "VertSplit", { fg = gray, bg = "NONE" })

-- Force standard syntax code groups to be pure black (Strings removed from this list)
local syntax_groups = {
	"Constant",
	"Character",
	"Number",
	"Boolean",
	"Float",
	"Identifier",
	"Function",
	"Statement",
	"Conditional",
	"Repeat",
	"Label",
	"Operator",
	"Keyword",
	"Exception",
	"PreProc",
	"Include",
	"Define",
	"Macro",
	"PreCondit",
	"Type",
	"StorageClass",
	"Structure",
	"Typedef",
	"Special",
	"SpecialChar",
	"Tag",
	"Delimiter",
	"SpecialComment",
	"Debug",
	"Underlined",
	"Ignore",
	"Todo",
}

for _, group in ipairs(syntax_groups) do
	vim.api.nvim_set_hl(0, group, { fg = black, bg = "NONE" })
end

-- Explicitly set Strings to Green
vim.api.nvim_set_hl(0, "String", { fg = green, bg = "NONE" })

-- Comments (Muted Gray + Italic, transparent bg)
vim.api.nvim_set_hl(0, "Comment", { fg = gray, bg = "NONE", italic = true })

-- Treesitter Overrides
-- Forces default treesitter tokens to black text, transparent bg
for _, capture in ipairs(vim.fn.getcompletion("@", "highlight")) do
	vim.api.nvim_set_hl(0, capture, { fg = black, bg = "NONE" })
end

-- Remap Treesitter strings and comments so they stay colored properly
vim.api.nvim_set_hl(0, "@string", { link = "String" })
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })

-- Diagnostics & Errors Text Colors
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = red, bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = yellow, bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = blue, bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = blue, bg = "NONE" })

-- Diagnostic Underline Colors (Squiggly lines under code)
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = red, fg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = yellow, fg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = blue, fg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = blue, fg = "NONE" })
