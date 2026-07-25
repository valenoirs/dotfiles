local function create_flyway_migration(prefix, prompt_text)
	local root = vim.fn.getcwd()
	local migration_path = root .. "/src/main/resources/db/migration/"
	local timestamp = os.date("%Y.%m.%d.%H%M%S")

	vim.fn.mkdir(migration_path, "p")

	vim.ui.input({ prompt = prompt_text }, function(input)
		if not input or input == "" then
			return
		end

		local formatted_desc = input:gsub("%s+", "_")
		local filename = string.format("%s%s%s__%s.sql", migration_path, prefix, timestamp, formatted_desc)

		vim.cmd("edit " .. filename)
		print("Created migration: " .. filename)
	end)
end

vim.keymap.set("n", "<leader>Fv", function()
	create_flyway_migration("V", "Migration Description: ")
end, { desc = "Create Timestamp Flyway Migration" })

vim.keymap.set("n", "<leader>Fu", function()
	create_flyway_migration("U", "Undo Migration Description: ")
end, { desc = "Create Timestamp Flyway Undo Migration" })
