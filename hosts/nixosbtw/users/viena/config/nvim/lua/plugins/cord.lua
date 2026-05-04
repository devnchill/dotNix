local lz = require("lz.n")

local function workspace(opts)
	return ("in %s"):format(opts.workspace)
end

local function editing(opts)
	local verb = opts.is_read_only and "Viewing" or "Editing"
	return ("%s %s (%s)"):format(verb, opts.filename, opts.filetype)
end

local function file_browser(opts)
	return ("Browsing %s"):format(opts.workspace)
end

local function docs(opts)
	return ("Reading docs: %s"):format(opts.name)
end

lz.load({
	{
		"cord.nvim",
		event = "UIEnter",
		keys = {
			{
				"<leader>Ct",
				function()
					require("cord.api.command").toggle_presence()
				end,
				desc = "cord: toggle presence",
			},
			{
				"<leader>Ci",
				function()
					require("cord.api.command").toggle_idle_force()
				end,
				desc = "cord: force idle",
			},
		},
		after = function()
			require("cord").setup({
				display = {
					theme = "atom",
					flavor = "dark",
				},
				idle = {
					enabled = false,
				},
				editor = { client = "1500729004163076166" },
				text = {
					default = "Using Viena.nvim",
					docs = docs,
					workspace = workspace,
					editing = editing,
					viewing = editing,
					file_browser = file_browser,
					vcs = "Committing war crimes",
					test = "100% Testcoverage 0% useful",
					notes = "noting down things that i'll never read",
					debug = "bugs are gross",
					terminal = "Running commands I half remember",
					diagnostics = "Checking issues",
					games = nil,
					lsp = nil,
					dashboard = nil,
				},
			})
		end,
	},
})
