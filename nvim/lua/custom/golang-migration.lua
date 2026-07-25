local function generate_sql_file(target_dir, is_seeder)
	local root = vim.fn.getcwd()
	local path = root .. "/" .. target_dir .. "/"

	vim.ui.input({ prompt = "Schema Prefix (default 1): " }, function(schema_input)
		if schema_input == nil then
			return
		end
		local schema = schema_input == "" and "1" or schema_input

		vim.ui.input({ prompt = "Name (e.g., create_user): " }, function(name_input)
			if not name_input or name_input == "" then
				print("Cancelled: Name is required.")
				return
			end

			vim.fn.mkdir(path, "p")

			local date = os.date("%Y%m%d")
			local formatted_name = name_input:gsub("%s+", "_")

			-- Find the latest sequence number
			local pattern = path .. schema .. "[0-9][0-9][0-9]_*.sql"
			local files = vim.fn.glob(pattern, false, true)
			local max_seq = 0

			for _, file in ipairs(files) do
				local basename = vim.fn.fnamemodify(file, ":t")
				local seq_str = basename:match("^" .. vim.pesc(schema) .. "(%d%d%d)_")
				if seq_str then
					local seq = tonumber(seq_str)
					if seq > max_seq then
						max_seq = seq
					end
				end
			end

			-- Increment and format
			local next_seq = string.format("%03d", max_seq + 1)
			local base_filename = string.format("%s%s_%s_%s", schema, next_seq, date, formatted_name)

			local up_file = path .. base_filename .. ".up.sql"

			-- Create UP file
			local f_up = io.open(up_file, "w")
			if f_up then
				f_up:close()
			end

			-- Create DOWN file only if it's a migration (seeders don't use them)
			if not is_seeder then
				local down_file = path .. base_filename .. ".down.sql"
				local f_down = io.open(down_file, "w")
				if f_down then
					f_down:close()
				end
			end

			vim.cmd("edit " .. up_file)

			if is_seeder then
				print("Created seeder: " .. base_filename .. ".up.sql")
			else
				print("Created migration: " .. base_filename .. ".{up,down}.sql")
			end
		end)
	end)
end

local function create_migration()
	generate_sql_file("migrations", false)
end
local function create_seeder()
	generate_sql_file("seeders", true)
end

vim.keymap.set("n", "<leader>Gm", create_migration, { desc = "Go: Create Migration" })
vim.keymap.set("n", "<leader>Gs", create_seeder, { desc = "Go: Create Seeder" })
