local lz = require("lz.n")

lz.load({
	{
		"grug-far.nvim",
		cmd = { "GrugFar", "GrugFarReplace" },
		after = function()
			require("grug-far").setup({})
		end,
	},
})
