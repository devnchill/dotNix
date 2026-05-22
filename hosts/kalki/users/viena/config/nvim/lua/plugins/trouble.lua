local lz = require("lz.n")

lz.load({
	{
		"trouble.nvim",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "global Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
		},

		after = function()
			require("trouble").setup({})
		end,
	},
})
