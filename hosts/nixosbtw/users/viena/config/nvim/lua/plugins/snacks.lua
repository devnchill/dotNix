require("snacks").setup({
  bigfile = { enabled = true },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true, timeout = 3000 },
  picker = {
    sources = {
      explorer = {
        layout = {
          layout = {
            position = "right", -- this moves the explorer to the right
          },
        },
        -- -- optional: preset sidebar without preview
        -- preset = "sidebar",
        -- preview = false,
      },
    },
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  styles = { notification = {} },
})

