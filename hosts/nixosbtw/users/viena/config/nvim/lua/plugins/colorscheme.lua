local colors = require("gruvbox-material.colors").get(vim.o.background, "hard")

require("gruvbox-material").setup({
	italics = true,
	contrast = "hard",
	comments = {
		italics = true,
	},
	customize = function(group, opts)
		if group == "CursorLineNr" then
			opts.fg = colors.orange
		end

		if group == "NormalFloat" or group == "FloatBorder" then
			opts.bg = "#1d2021"
		end

		if group == "TermCursor" then
			opts.fg = "#fabd2f"
		end

		return opts
	end,
})

vim.cmd.colorscheme("gruvbox-material")
