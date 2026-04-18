local lz = require("lz.n")

lz.load({
	{
		"mini-icons",
		event = "UIEnter",
		after = function()
			require("mini.icons").setup({
				style = "glyph",
			})
		end,
	},
})
