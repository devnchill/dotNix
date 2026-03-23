local dap, dapui = require("dap"), require("dapui")

dap.adapters.lldb = {
	type = "executable",
	name = "lldb",
	command = "/nix/store/dz1lv10zfqhdnpdjqbawdacd6j1328m1-lldb-21.1.8/bin/lldb-dap",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
