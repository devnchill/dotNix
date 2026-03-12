vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "material"
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd.colorscheme("gruvbox-material")

-- override highlight groups
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1d2021" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1d2021" })
vim.api.nvim_set_hl(0, "TermCursor", { fg = "#fabd2f" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fabd2f" })
