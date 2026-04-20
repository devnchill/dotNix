require("lz.n").load({
	{
		"bufferline.nvim",
		event = "UIEnter",

		keys = {
			{
				"<leader>bo",
				function()
					vim.cmd("BufferLineCloseOthers")
				end,
				desc = "Close Other Buffers",
			},
			{
				"<leader>bl",
				function()
					vim.cmd("BufferLineCloseLeft")
				end,
				desc = "Close Left Buffers",
			},
			{
				"<leader>br",
				function()
					vim.cmd("BufferLineCloseRight")
				end,
				desc = "Close Right Buffers",
			},
			{
				"H",
				function()
					vim.cmd("bprev")
				end,
				desc = "Prev Buffer",
			},
			{
				"L",
				function()
					vim.cmd("bnext")
				end,
				desc = "Next Buffer",
			},
		},

		after = function()
			local ok, bufferline = pcall(require, "bufferline")
			if not ok then
				error("[lz.n] bufferline failed to load")
			end

			bufferline.setup({
				options = {
					mode = "buffers",
					diagnostics = "nvim_lsp",
				},
			})
		end,
	},
})
