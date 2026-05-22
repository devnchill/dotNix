local lz = require("lz.n")

lz.load({
	{
		"grug-far.nvim",
		cmd = { "GrugFar", "GrugFarReplace" },
		keys = {
			{
				"<leader>srn",
				"<cmd>GrugFar<CR>",
				{ desc = "search and replace" },
			},
			{
				"<leader>srw",
				function()
					require("grug-far").open({
						prefills = {
							search = vim.fn.expand("<cword>"),
						},
					})
				end,
				{ desc = "search and replace word under cursor" },
			},
		},
		after = function()
			require("grug-far").setup({})
		end,
	},
})
