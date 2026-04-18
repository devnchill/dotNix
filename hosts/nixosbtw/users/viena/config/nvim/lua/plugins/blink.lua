local lz = require("lz.n")

lz.load({
	{
		"blink.cmp",
		event = "InsertEnter",
		after = function()
			require("blink-cmp").setup({
				completion = {
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 500,
						window = {
							border = "rounded",
						},
					},
					menu = {
						border = "rounded",
					},
				},
			})
		end,
	},
})
