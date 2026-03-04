require("snacks").setup({
	bigfile = { enabled = true },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	notifier = { enabled = true, timeout = 3000 },
	lazygit = {
		enabled = true,
		configure = true,
	},
	picker = {
		sources = {
			explorer = {
				layout = {
					layout = {
						position = "right",
					},
				},
			},
		},
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = { notification = {} },
})
