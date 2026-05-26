local lz = require("lz.n")

lz.load({
	{
		"mini.pairs",
		event = "InsertEnter",
		after = function()
			require("mini.pairs").setup({
				markdown = true,
				skip_unbalanced = true,
				skip_ts = { "string" },
				skip_nest = [=[[%w%%%'%[%"%.%`%$]]=],
			})
		end,
	},
})
