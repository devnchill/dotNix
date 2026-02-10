vim.lsp.config["typescript_lsp"] = {
	command = { "typescript-language-server", "--stdio" },
	filetypes = { "ts", "tsx", "js", "jsx", "cjs", "cts", "mjs", "mts" },
}
vim.lsp.enable("typescript-language-server")
