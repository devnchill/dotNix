local colors = require("gruvbox-material.colors").get(vim.o.background, "hard")

require("gruvbox-material").setup({
	italics = true,
	contrast = "hard",

	comments = {
		italics = true,
	},

	customize = function(group, opts)
		local italic_groups = {
			"@keyword.conditional",
			"@keyword.repeat",
		}

		local bold_groups = {
			"@function.method",
			"@constant",
		}

		if vim.tbl_contains(italic_groups, group) then
			opts.link = nil
			opts.italic = true
			opts.fg = colors.red
		end

		if vim.tbl_contains(bold_groups, group) then
			opts.link = nil
			opts.bold = true
			opts.fg = colors.orange
		end

		if group == "@keyword.function" then
			opts.link = nil
			opts.fg = colors.yellow
		end

		if group == "@constant" then
			opts.link = nil
			opts.fg = colors.purple
		end

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
