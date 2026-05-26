vim.lsp.config["nix_ls"] = {
	cmd = { "nil" },
	filetypes = { "nix" },
}

vim.lsp.enable("nix_ls")
