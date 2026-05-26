local lz = require("lz.n")

lz.load({
	{
		"tmux.nvim",
		keys = {
			"<C-h>",
			"<C-j>",
			"<C-k>",
			"<C-l>",
		},
		after = function()
			require("tmux").setup({
				navigation = {
					cycle_navigation = true,
					enable_default_keybindings = true,
					persist_zoom = false,
				},
			})
		end,
	},
})
