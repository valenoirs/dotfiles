return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("nvim-dap-virtual-text").setup()
		require("dap-go").setup()

		dapui.setup()

		dap.adapters.go = {
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}" },
			},
			options = {
				initialize_timeout_sec = 20,
			},
		}

		dap.configurations.java = {
			{
				type = "java",
				request = "attach",
				name = "Attach to Gradle (5005)",
				hostName = "127.0.0.1",
				port = 5005,
			},
		}

		-- NOTE: Removed because in attach mode, launch is often never fired.
		-- setup an event listener for when the debugger is launched, open up the debug ui
		-- dap.listeners.before.launch.dapui_config = function()
		-- dapui.open()
		-- end

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
		vim.keymap.set("n", "<leader>dq", dapui.close, { desc = "[D]ebug [C]lose" })
		vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "Toggle UI" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<leader>db", dap.step_back, { desc = "Step Back" })
		vim.keymap.set("n", "<leader>dw", ":DapViewWatch<CR>", { desc = "View Watch" })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart Debugger" })
		vim.keymap.set("n", "<leader>de", ":DapEval<CR>", { desc = "Open Evaluate" })
		vim.keymap.set({ "n", "v" }, "<leader>d?", function()
			require("dapui").eval(nil, { enter = true })
		end, { desc = "Open Floating Evaluate" })

		vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
		vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
		vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "●", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "▶", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
		)
	end,
}
