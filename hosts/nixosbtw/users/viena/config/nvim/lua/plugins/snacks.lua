local lz = require("lz.n")

lz.load({
	{
		"snacks.nvim",

		-- Lazy-load trigger: ALL your mappings
		keys = {
			-- core picker / explorer
			{
				"<leader><space>",
				function()
					require("snacks").picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>,",
				function()
					require("snacks").picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>/",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>:",
				function()
					require("snacks").picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>n",
				function()
					require("snacks").picker.notifications()
				end,
				desc = "Notification History",
			},

			{
				"<leader>e",
				function()
					require("snacks").explorer()
				end,
				desc = "File Explorer",
			},
			{
				"<leader>E",
				function()
					require("snacks").explorer.open({ cwd = vim.fn.getcwd() })
				end,
				desc = "File Explorer (cwd)",
			},

			-- find
			{
				"<leader>fb",
				function()
					require("snacks").picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ff",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("snacks").picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fp",
				function()
					require("snacks").picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<leader>fr",
				function()
					require("snacks").picker.recent()
				end,
				desc = "Recent",
			},

			-- git
			{
				"<leader>gb",
				function()
					require("snacks").picker.git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<leader>gl",
				function()
					require("snacks").picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gL",
				function()
					require("snacks").picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>gs",
				function()
					require("snacks").picker.git_status()
				end,
				desc = "Git Status",
			},
			{
				"<leader>gS",
				function()
					require("snacks").picker.git_stash()
				end,
				desc = "Git Stash",
			},
			{
				"<leader>gd",
				function()
					require("snacks").picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>gf",
				function()
					require("snacks").picker.git_log_file()
				end,
				desc = "Git Log File",
			},

			-- github
			{
				"<leader>gi",
				function()
					require("snacks").picker.gh_issue()
				end,
				desc = "GitHub Issues (open)",
			},
			{
				"<leader>gI",
				function()
					require("snacks").picker.gh_issue({ state = "all" })
				end,
				desc = "GitHub Issues (all)",
			},
			{
				"<leader>gp",
				function()
					require("snacks").picker.gh_pr()
				end,
				desc = "GitHub PRs (open)",
			},
			{
				"<leader>gP",
				function()
					require("snacks").picker.gh_pr({ state = "all" })
				end,
				desc = "GitHub PRs (all)",
			},

			-- grep
			{
				"<leader>sb",
				function()
					require("snacks").picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sB",
				function()
					require("snacks").picker.grep_buffers()
				end,
				desc = "Grep Buffers",
			},
			{
				"<leader>sg",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sw",
				function()
					require("snacks").picker.grep_word()
				end,
				mode = { "n", "x" },
				desc = "Grep Word",
			},

			-- search
			{
				"<leader>s/",
				function()
					require("snacks").picker.search_history()
				end,
				desc = "Search History",
			},
			{
				"<leader>sa",
				function()
					require("snacks").picker.autocmds()
				end,
				desc = "Autocmds",
			},
			{
				"<leader>sC",
				function()
					require("snacks").picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>sd",
				function()
					require("snacks").picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>sD",
				function()
					require("snacks").picker.diagnostics_buffer()
				end,
				desc = "Buffer Diagnostics",
			},
			{
				"<leader>sh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>sH",
				function()
					require("snacks").picker.highlights()
				end,
				desc = "Highlights",
			},
			{
				"<leader>sj",
				function()
					require("snacks").picker.jumps()
				end,
				desc = "Jumps",
			},
			{
				"<leader>sk",
				function()
					require("snacks").picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>sm",
				function()
					require("snacks").picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>sM",
				function()
					require("snacks").picker.man()
				end,
				desc = "Man Pages",
			},
			{
				"<leader>sq",
				function()
					require("snacks").picker.qflist()
				end,
				desc = "Quickfix List",
			},
			{
				"<leader>sR",
				function()
					require("snacks").picker.resume()
				end,
				desc = "Resume",
			},
			{
				"<leader>su",
				function()
					require("snacks").picker.undo()
				end,
				desc = "Undo History",
			},
			{
				"<leader>uC",
				function()
					require("snacks").picker.colorschemes()
				end,
				desc = "Colorschemes",
			},

			-- lsp
			{
				"gd",
				function()
					require("snacks").picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gD",
				function()
					require("snacks").picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"gr",
				function()
					require("snacks").picker.lsp_references()
				end,
				desc = "References",
			},
			{
				"gI",
				function()
					require("snacks").picker.lsp_implementations()
				end,
				desc = "Implementation",
			},
			{
				"gy",
				function()
					require("snacks").picker.lsp_type_definitions()
				end,
				desc = "Type Definition",
			},

			{
				"gai",
				function()
					require("snacks").picker.lsp_incoming_calls()
				end,
				desc = "Incoming Calls",
			},
			{
				"gao",
				function()
					require("snacks").picker.lsp_outgoing_calls()
				end,
				desc = "Outgoing Calls",
			},

			{
				"<leader>ss",
				function()
					require("snacks").picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					require("snacks").picker.lsp_workspace_symbols()
				end,
				desc = "Workspace Symbols",
			},

			-- misc snacks
			{
				"<leader>z",
				function()
					require("snacks").zen()
				end,
				desc = "Zen Mode",
			},
			{
				"<leader>wm",
				function()
					require("snacks").zen.zoom()
				end,
				desc = "Zoom",
			},

			{
				"<leader>.",
				function()
					require("snacks").scratch()
				end,
				desc = "Scratch",
			},
			{
				"<leader>S",
				function()
					require("snacks").scratch.select()
				end,
				desc = "Scratch Select",
			},

			{
				"<leader>bd",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>cR",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Rename File",
			},

			{
				"<leader>gB",
				function()
					require("snacks").gitbrowse()
				end,
				mode = { "n", "v" },
				desc = "Git Browse",
			},
			{
				"<leader>gg",
				function()
					require("snacks").lazygit()
				end,
				desc = "LazyGit",
			},

			{
				"<leader>un",
				function()
					require("snacks").notifier.hide()
				end,
				desc = "Dismiss Notifications",
			},

			-- words
			{
				"]]",
				function()
					require("snacks").words.jump(vim.v.count1)
				end,
				mode = { "n", "t" },
				desc = "Next Reference",
			},
			{
				"[[",
				function()
					require("snacks").words.jump(-vim.v.count1)
				end,
				mode = { "n", "t" },
				desc = "Prev Reference",
			},

			-- terminal
			{
				"<C-_>",
				function()
					require("snacks").terminal()
				end,
				mode = { "n", "t" },
				desc = "Terminal",
			},

			-- misc
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Which Key",
			},
			{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
		},

		after = function()
			require("snacks").setup({
				bigfile = { enabled = true },
				explorer = { enabled = true },
				indent = { enabled = true },
				input = { enabled = true },
				notifier = { enabled = true, timeout = 3000 },
				lazygit = { enabled = true, configure = true },
				picker = {
					sources = {
						explorer = {
							layout = {
								layout = { position = "right" },
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
		end,
	},
})
