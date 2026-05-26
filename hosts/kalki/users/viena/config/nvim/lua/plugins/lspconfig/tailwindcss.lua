vim.lsp.config["tailwindcss_lsp"] = {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"css",
		"scss",
		"html",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
	},
	root_markers = { "tailwind.config.js", "package.json", ".git" },
	single_file_support = true,
	settings = {},
}

vim.lsp.enable("tailwindcss_lsp")
