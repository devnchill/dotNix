vim.lsp.config["typescript_lsp"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
  },
}

vim.lsp.enable("typescript_lsp")

