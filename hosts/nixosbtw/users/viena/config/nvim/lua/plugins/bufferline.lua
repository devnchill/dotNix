local lz = require("lz.n")

lz.load({
	{
		"bufferline.nvim",
		event = "BufEnter",
		after = function()
			require("bufferline").setup({})
		end,
	},
})
