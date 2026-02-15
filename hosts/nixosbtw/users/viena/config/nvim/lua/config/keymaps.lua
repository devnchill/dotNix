local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function project_root()
  local root = vim.fs.root(0, { ".git", "lua", "package.json", "pyproject.toml" ,"go.mod"})
  return root or vim.loop.cwd()
end

-- Toggle 
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ..." })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Move Lines 
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
Snacks.toggle.zen():map("<leader>uz")

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Bufferline
map("n","<leader>bo",":BufferLineCloseOthers<CR>",{ desc = "Close Other Buffers" })
map("n","<leader>bl",":BufferLineCloseLeft<CR>",{ desc = "Close Left Buffers" })
map("n","<leader>br",":BufferLineCloseRight<CR>",{ desc = "Close Right Buffers" })
map("n","H",":bprev<CR>",{ desc = "Goto Prev Buffer" })
map("n","L",":bnext<CR>",{ desc = "Goto Next Buffer" })

-- Top Pickers & Explorer
map("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
map("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
map("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
map("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })
map("n", "<leader>E", function() Snacks.explorer.open({ cwd = vim.fn.getcwd() }) end, { desc = "File Explorer (cwd)" })

-- find
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
map("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })

-- git
map("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
map("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
map("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })

-- gh
map("n", "<leader>gi", function() Snacks.picker.gh_issue() end, { desc = "GitHub Issues (open)" })
map("n", "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, { desc = "GitHub Issues (all)" })
map("n", "<leader>gp", function() Snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" })
map("n", "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, { desc = "GitHub Pull Requests (all)" })

-- Grep
map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
map("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })

-- search
map("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
map("n", "<leader>s/", function() Snacks.picker.search_history() end, { desc = "Search History" })
map("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
map("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
map("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
map("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
map("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
map("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
map("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
map("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
map("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
map("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
map("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
map("n", "<leader>sp", function() Snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
map("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
map("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
map("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
map("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

-- LSP
map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
map("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
map("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "References" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Variable" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto Type Definition" })
map("n", "gai", function() Snacks.picker.lsp_incoming_calls() end, { desc = "Calls Incoming" })
map("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "Calls Outgoing" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })

-- Other
map("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
map("n", "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
map("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
map({ "n", "v" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
map("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss Notifications" })

map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })

-- WHICH KEY
map("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Global keymap for which key" })

-- TERMINAL
map("t", "<C-q>", [[<C-\><C-n>]], {})
map({ "n", "t" }, "<C-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
map({ "n", "t" }, "<C-_>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })

-- floating terminal
map("n", "<leader>fT", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

map("n", "<leader>ft", function()
  Snacks.terminal(nil, { cwd = project_root() })
end, { desc = "Terminal (Root Dir)" })

map({ "n","t" }, "<c-/>", function()
  Snacks.terminal(nil, { cwd = project_root() })
end, { desc = "Terminal (Root Dir)" })

map({ "n","t" }, "<c-_>", function()
  Snacks.terminal(nil, { cwd = project_root() })
end, { desc = "which_key_ignore" })
