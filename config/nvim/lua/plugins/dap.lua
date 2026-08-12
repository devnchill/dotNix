require("lz.n").load({
	{
		"nvim-dap-ui",
	},
	{
		"nvim-dap",

		before = function()
			require("lz.n").trigger_load("nvim-dap-ui")
		end,

		keys = {
			{
				"<leader>dbb",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle breakpoint",
			},
			{
				"<leader>dbc",
				function()
					require("dap").clear_breakpoints()
				end,
				desc = "Clear breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Dap continue",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Dap Terminate",
			},
			{
				"<leader>dn",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
			},
			{
				"<leader>dsi",
				function()
					require("dap").step_into()
				end,
				desc = "Step into",
			},
			{
				"<leader>dso",
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<leader>dbq",
				function()
					require("dap").set_breakpoint(vim.fn.input("Condition: "))
				end,
				desc = "Conditional breakpoint",
			},
			{
				"<leader>dbl",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "Log point",
			},
			{
				"<leader>dbr",
				function()
					require("dap").run_last()
				end,
				desc = "Run last config",
			},
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle DAP UI",
			},
			{
				"<leader>dh",
				function()
					require("dapui").hover()
				end,
				desc = "Hover variable",
			},
			{
				"<leader>de",
				function()
					require("dapui").eval()
				end,
				desc = "Evaluate cursor",
			},
		},

		after = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			dap.listeners.after.event_initialized["dapui"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui"] = function()
				dapui.close()
			end

			dap.adapters.lldb = {
				type = "executable",
				name = "lldb",
				command = "lldb-dap",
			}

			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path: ", vim.fn.getcwd() .. "/", "file")
					end,
				},
			}
		end,
	},
})
