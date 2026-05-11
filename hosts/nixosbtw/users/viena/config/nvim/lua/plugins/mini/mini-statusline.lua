local lz = require("lz.n")

lz.load({
	{
		"mini.statusline",
		event = { "BufEnter", "VimEnter" },

		after = function()
			vim.opt.laststatus = 3

			local colors = require("gruvbox-material.colors").get(vim.o.background, "hard")

			-- MODE
			vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", {
				fg = "#000000",
				bg = "#fabd2f",
				bold = true,
			})

			vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", {
				fg = "#000000",
				bg = "#83a598",
				bold = true,
			})

			vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", {
				fg = "#000000",
				bg = "#d3869b",
				bold = true,
			})

			vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", {
				fg = "#000000",
				bg = "#fe8019",
				bold = true,
			})

			vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", {
				fg = "#000000",
				bg = "#fb4934",
				bold = true,
			})
			-- GIT
			vim.api.nvim_set_hl(0, "MiniStatuslineGit", {
				fg = colors.aqua,
				bg = colors.bg1,
			})

			-- DIFF
			vim.api.nvim_set_hl(0, "MiniStatuslineDiff", {
				fg = colors.orange,
				bg = colors.bg1,
			})

			-- DIAGNOSTICS
			vim.api.nvim_set_hl(0, "MiniStatuslineDiagnostics", {
				fg = colors.red,
				bg = colors.bg1,
				bold = true,
			})

			-- LSP
			vim.api.nvim_set_hl(0, "MiniStatuslineLsp", {
				fg = colors.blue,
				bg = colors.bg1,
			})

			-- FILENAME
			vim.api.nvim_set_hl(0, "MiniStatuslineFilename", {
				fg = colors.fg0,
				bg = colors.bg2,
				bold = true,
			})

			-- FILEINFO
			vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", {
				fg = colors.fg1,
				bg = colors.bg1,
			})

			-- LOCATION
			vim.api.nvim_set_hl(0, "MiniStatuslineLocation", {
				fg = colors.green,
				bg = colors.bg1,
				bold = true,
			})

			-- INACTIVE
			vim.api.nvim_set_hl(0, "MiniStatuslineInactive", {
				fg = colors.gray,
				bg = colors.bg0,
			})

			local MiniStatusline = require("mini.statusline")

			local function diagnostics_component()
				local diagnostics = vim.diagnostic.count(0)

				local errors = diagnostics[vim.diagnostic.severity.ERROR] or 0

				local warns = diagnostics[vim.diagnostic.severity.WARN] or 0

				local parts = {}

				if errors > 0 then
					table.insert(parts, " " .. errors)
				end

				if warns > 0 then
					table.insert(parts, " " .. warns)
				end

				return table.concat(parts, " ")
			end

			local function short_filename()
				local path = vim.fn.expand("%:.")

				if path == "" then
					return "[No Name]"
				end

				local parts = vim.split(path, "/")

				if #parts <= 4 then
					return path
				end

				return table.concat(vim.list_slice(parts, #parts - 3, #parts), "/")
			end

			MiniStatusline.setup({
				use_icons = true,

				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({
							trunc_width = 120,
						})

						local git = MiniStatusline.section_git({
							trunc_width = 75,
						})

						local diff = MiniStatusline.section_diff({
							trunc_width = 75,
						})

						local diagnostics = diagnostics_component()

						local lsp = MiniStatusline.section_lsp({
							trunc_width = 75,
						})

						local filename = short_filename()

						local fileinfo = MiniStatusline.section_fileinfo({
							trunc_width = 120,
						})

						local location = MiniStatusline.section_location({
							trunc_width = 75,
						})

						local search = MiniStatusline.section_searchcount({
							trunc_width = 75,
						})

						local groups = {
							-- MODE
							{
								hl = mode_hl,
								strings = { mode },
							},

							-- GIT
							{
								hl = "MiniStatuslineGit",
								strings = { git },
							},

							-- DIFF
							{
								hl = "MiniStatuslineDiff",
								strings = { diff },
							},
						}

						-- DIAGNOSTICS
						if diagnostics ~= "" then
							table.insert(groups, {
								hl = "MiniStatuslineDiagnostics",
								strings = { diagnostics },
							})
						end

						-- LSP
						if lsp ~= "" then
							table.insert(groups, {
								hl = "MiniStatuslineLsp",
								strings = { " " .. lsp },
							})
						end

						table.insert(groups, "%<")

						-- FILENAME
						table.insert(groups, {
							hl = "MiniStatuslineFilename",
							strings = { filename },
						})

						table.insert(groups, "%=")

						-- FILEINFO
						table.insert(groups, {
							hl = "MiniStatuslineFileinfo",
							strings = { fileinfo },
						})

						-- LOCATION
						table.insert(groups, {
							hl = "MiniStatuslineLocation",
							strings = { search, location },
						})

						return MiniStatusline.combine_groups(groups)
					end,
				},
			})
		end,
	},
})
