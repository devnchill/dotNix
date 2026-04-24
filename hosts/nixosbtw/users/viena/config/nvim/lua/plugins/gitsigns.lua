local lz = require("lz.n")

lz.load({
	{
		"gitsigns.nvim",
		event = "BufReadPost",

		keys = {
			{
				"]h",
				function()
					require("gitsigns").nav_hunk("next")
				end,
				desc = "Next Hunk",
			},
			{
				"[h",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
				desc = "Prev Hunk",
			},
			{
				"]H",
				function()
					require("gitsigns").nav_hunk("last")
				end,
				desc = "Last Hunk",
			},
			{
				"[H",
				function()
					require("gitsigns").nav_hunk("first")
				end,
				desc = "First Hunk",
			},

			-- actions
			{
				"<leader>ghs",
				"<cmd>Gitsigns stage_hunk<CR>",
				desc = "Stage Hunk",
				mode = { "n", "x" },
			},
			{
				"<leader>ghr",
				"<cmd>Gitsigns reset_hunk<CR>",
				desc = "Reset Hunk",
				mode = { "n", "x" },
			},
			{
				"<leader>ghS",
				function()
					require("gitsigns").stage_buffer()
				end,
				desc = "Stage Buffer",
			},
			{
				"<leader>ghu",
				function()
					require("gitsigns").undo_stage_hunk()
				end,
				desc = "Undo Stage Hunk",
			},
			{
				"<leader>ghR",
				function()
					require("gitsigns").reset_buffer()
				end,
				desc = "Reset Buffer",
			},
			{
				"<leader>ghpi",
				function()
					require("gitsigns").preview_hunk_inline()
				end,
				desc = "Preview Hunk Inline",
			},
			{
				"<leader>ghpb",
				function()
					require("gitsigns").preview_hunk()
				end,
				desc = "Preview Hunk in popup",
			},
			{
				"<leader>ghb",
				function()
					require("gitsigns").blame_line({ full = true })
				end,
				desc = "Blame Line",
			},
			{
				"<leader>ghB",
				function()
					require("gitsigns").blame()
				end,
				desc = "Blame Buffer",
			},
			{
				"<leader>ghd",
				function()
					require("gitsigns").diffthis()
				end,
				desc = "Diff This",
			},
			{
				"<leader>ghD",
				function()
					require("gitsigns").diffthis("~")
				end,
				desc = "Diff This ~",
			},

			-- text object
			{
				"ih",
				":<C-U>Gitsigns select_hunk<CR>",
				mode = { "o", "x" },
				desc = "Select Hunk",
			},

			-- quickfix list
			{
				"<leader>ghQ",
				function()
					require("gitsigns").setqflist("all")
				end,
				{ desc = "hunks-> quickfix all" },
			},
			{
				"<leader>ghq",
				function()
					require("gitsigns").setqflist()
				end,
				{ desc = "hunks-> quickfix for current file" },
			},
		},

		after = function()
			require("gitsigns").setup({
				current_line_blame = true,
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},
				signs_staged = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
				},
			})
		end,
	},
})
