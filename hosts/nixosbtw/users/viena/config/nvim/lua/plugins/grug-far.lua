local lz = require("lz.n")

lz.load({
	{
		"grug-far.nvim",
		cmd = { "GrugFar", "GrugFarReplace" },
		keys = {
			{
				"<leader>sr",
				"<cmd>GrugFar<CR>",
				{ desc = "search and replace" },
			},
		},
		after = function()
			require("grug-far").setup({})
		end,
	},
})
