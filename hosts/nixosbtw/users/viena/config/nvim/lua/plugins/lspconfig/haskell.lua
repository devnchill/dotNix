vim.lsp.config["hls"] = {
	cmd = { "haskell-language-server-wrapper", "--lsp" },
	filetypes = { "haskell", "lhaskell" },
	root_markers = { "hie.yaml", "stack.yaml", "cabal.project", "*.cabal", ".git" },
}

vim.lsp.enable("hls")
