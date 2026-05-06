local lz = require("lz.n")

lz.load({
	{
		"oil.nvim",

		keys = {
			{
				"<leader>e",
				function()
					require("oil").open()
				end,
				desc = "Open Oil (parent dir)",
			},
			{
				"<leader>E",
				function()
					require("oil").open(vim.fn.getcwd())
				end,
				desc = "Open Oil (cwd)",
			},
		},

		after = function()
			require("oil").setup()
		end,
	},
})
