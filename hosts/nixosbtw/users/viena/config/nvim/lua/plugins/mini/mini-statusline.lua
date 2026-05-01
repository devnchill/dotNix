local lz = require("lz.n")

lz.load({
	{
		"mini.statusline",
		event = { "BufEnter", "VimEnter" },
		after = function()
			vim.opt.laststatus = 2

			vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#1e1e2e", bg = "#a6e3a1", bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "#1e1e2e", bg = "#89b4fa", bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "#1e1e2e", bg = "#f38ba8", bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = "#1e1e2e", bg = "#fab387", bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = "#1e1e2e", bg = "#cba6f7", bold = true })

			local MiniStatusline = require("mini.statusline")
			require("mini.statusline").setup({
				use_icons = true,
				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local git = MiniStatusline.section_git({ trunc_width = 75 })
						local diff = MiniStatusline.section_diff({ trunc_width = 75 })
						local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
						local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
						local filename = MiniStatusline.section_filename({ trunc_width = 140 })
						local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
						local location = MiniStatusline.section_location({ trunc_width = 75 })
						local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
							"%<",
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=",
							{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
							{ hl = mode_hl, strings = { search, location } },
						})
					end,
				},
			})
		end,
	},
})
