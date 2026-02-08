local gruvbox = require("gruvbox")

gruvbox.setup({
  palette_overrides = { dark_hard = { bg = '#1d2021' } },
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = { strings = true, emphasis = true, comments = true, operators = false, folds = true },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true,
  contrast = "dark",
  dim_inactive = false,
  transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")

local palette = gruvbox.palette

vim.cmd(string.format([[
  highlight Normal guibg=%s ctermbg=235
  highlight NormalFloat guibg=%s ctermbg=235
  highlight FloatBorder guibg=%s guifg=%s ctermbg=235 ctermfg=214
  highlight Pmenu guibg=%s ctermbg=235
]], palette.dark0_hard, palette.dark0_hard, palette.dark0_hard, palette.bright_yellow, palette.dark0_hard))

