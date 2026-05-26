vim.lsp.config["prisma_ls"] = {
	cmd = { "prisma-language-server", "--stdio" },
	filetypes = { "prisma" },
	settings = {
		prisma = {
			prismaFmtBinPath = "",
		},
	},
}

vim.lsp.enable("prisma_ls")
