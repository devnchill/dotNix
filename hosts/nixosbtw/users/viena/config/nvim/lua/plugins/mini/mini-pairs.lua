local lz = require("lz.n")

lz.load({
	{
		"mini.pairs",
		event = "InsertEnter",
		after = function()
			require("mini.pairs").setup({})
		end,
	},
})
