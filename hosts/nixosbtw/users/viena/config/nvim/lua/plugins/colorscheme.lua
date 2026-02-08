require("gruvbox").setup({
  palette_overrides = {
    dark_hard = {
       bg = '#1d2021',
    },
  },
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
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
