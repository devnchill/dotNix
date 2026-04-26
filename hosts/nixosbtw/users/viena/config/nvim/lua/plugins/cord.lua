local lz = require("lz.n")

lz.load({
	{
		"cord.nvim",
		event = "UIEnter",
		keys = {
			{
				"<leader>Ct",
				function()
					require("cord.api.command").toggle_presence()
				end,
				desc = "cord: toggle presence",
			},
			{
				"<leader>Ci",
				function()
					require("cord.api.command").toggle_idle_force()
				end,
				desc = "cord: force idle",
			},
		},
		after = function()
			require("cord").setup({
				display = {
					theme = "atom",
					flavor = "dark",
				},
			})
		end,
	},
})
