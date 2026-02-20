vim.lsp.config["rust_analyzer"] = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "rust-project.json", ".git" },
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			lens = { enable = true },
			checkOnSave = {
				enable = true,
				command = "clippy",
				allFeatures = true,
			},
		},
	},
}

vim.lsp.enable("rust_analyzer")
