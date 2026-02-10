vim.lsp.config["go_lsp"] = {
	cmd = { "gopls" },
	filetypes = { "go" },
	root_markers = { "go.work", "go.mod", ".git" },
}

vim.lsp.enable("go_lsp")
