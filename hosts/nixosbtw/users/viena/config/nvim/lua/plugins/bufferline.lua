local lz = require("lz.n")

lz.load({
	{
		"bufferline",
		event = "BufEnter",
		after = function()
			require("bufferline").setup({})
		end,
	},
})
