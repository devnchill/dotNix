require("lz.n").load({
	{
		"nvim-dap",

		keys = {
			{
				"<leader>dbb",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
			{
				"<leader>dbc",
				function()
					require("dap").clear_breakpoints()
				end,
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
			},
		},

		after = function()
			local dap = require("dap")

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

			require("lz.n").trigger_load("nvim-dap-ui")
		end,
	},

	{
		"nvim-dap-ui",

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
		end,
	},
})
