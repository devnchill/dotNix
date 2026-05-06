local lz = require("lz.n")

local function is_always_hidden(name)
	return name == ".git"
end

lz.load({
	{
		"oil.nvim",

		keys = {
			{
				"<leader>o.",
				function()
					require("oil").open()
				end,
				desc = "open current folder",
			},
			{
				"<leader>o-",
				function()
					require("oil").open_float()
				end,
				desc = "open current folder (floating)",
			},
			{ "-", "<cmd>Oil --float<cr>", desc = "open current folder (floating)" },
		},

		after = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
					is_always_hidden = is_always_hidden,
				},
			})
		end,
	},
})
