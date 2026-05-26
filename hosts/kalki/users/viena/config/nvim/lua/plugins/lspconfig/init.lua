require("plugins.lspconfig.lua")
require("plugins.lspconfig.prisma")
require("plugins.lspconfig.docker")
require("plugins.lspconfig.nix")
require("plugins.lspconfig.cpp")
require("plugins.lspconfig.go")
require("plugins.lspconfig.css")
require("plugins.lspconfig.tailwindcss")
require("plugins.lspconfig.haskell")
require("plugins.lspconfig.json")
require("plugins.lspconfig.java")
require("plugins.lspconfig.rust")
require("plugins.lspconfig.typescript")
require("plugins.lspconfig.python")

vim.diagnostic.config({
	virtual_text = true,
	underline = false,
})
