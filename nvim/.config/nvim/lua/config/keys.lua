local wk = require("which-key")
local builtin = require('telescope.builtin')

-- Normal Mode
wk.register({
  g = {
    name = "Goto",
    I = { builtin.lsp_implementations, "Implementation" },
    d = { builtin.lsp_definitions, "Definitions" },
    D = { vim.lsp.buf.declaration, "Declaration" },
    r = { builtin.lsp_references, "References" },
  },
  K = { vim.lsp.buf.hover, "Hover documentation" },
  ["["] = {
    name = "Previous",
    d = { vim.diagnostic.goto_prev, "Previous diagnostic" },
  },
  ["]"] = {
    name = "Next",
    d = { vim.diagnostic.goto_prev, "Next diagnostic" },
  },
})

-- Buffer
wk.register({
  b = {
    name = "Buffer",
    b = { "<cmd>:b#<CR>", "Switch buffer" },
    d = { "<cmd>:bd<CR>", "Delete buffer" },
    f = { builtin.buffers, "find" },
    k = { "<cmd>:bd!<CR>", "Kill buffer" },
    n = { "<cmd>:bnext<CR>", "Next buffer" },
    p = { "<cmd>:bprevious<CR>", "Previous buffer" },
    R = { "<cmd>:e!<CR>", "Revert buffer" },
    s = { "<cmd>:w<CR>", "Save buffer" },
    w = { "<cmd>:YourWrapCommand<CR>", "Wrap buffer" },
  }
}, { prefix = "<leader>" })

-- Code
wk.register({
  c = {
    name = "Code",
    a = { vim.lsp.buf.code_action, "Action" },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
    D = { builtin.lsp_type_definitions, "Definitions" },
    g = {
      name = "Goto",
      I = { builtin.lsp_implementations, "Implementation" },
      d = { builtin.lsp_definitions, "Definitions" },
      D = { vim.lsp.buf.declaration, "Declaration" },
      r = { builtin.lsp_references, "References" },
    },
    k = { vim.lsp.buf.hover, "Hover" },
    m = {
      name = "Messages",
      e = { vim.diagnostic.open_float, "Error" },
      q = { vim.diagnostic.setloclist, "Quickfix" },
      p = { vim.diagnostic.goto_prev, "Previous diagnostic" },
      n = { vim.diagnostic.goto_next, "Next diagnostic" },
    },
    r = { vim.lsp.buf.rename, "Rename" },
    s = {
      name = "Symbols",
      d = { builtin.lsp_document_symbols, "Document" },
      w = { builtin.lsp_dynamic_workspace_symbols, "Workspace" },
    },
    t = {
      name = "Test",
      f = { "<cmd>GoTestFunc<CR>", "Function" },
      F = { "<cmd>GoTestFunc<CR>", "File" },
      P = { "<cmd>GoTestPkg<CR>", "Package" },
      s = { "<cmd>lua run_current_go_test_in_zellij()<CR>", "Single" },
    },

  }
}, { prefix = "<leader>" })

-- Files
wk.register({
  f = {
    name = "Files",
    f = { builtin.find_files, "Find" },
    g = { builtin.git_files, "Git" },
    n = { ":enew<CR>", "New" },
    o = { builtin.oldfiles, "Old" },
    s = { ":w<CR>", "Save" },
    y = { ":let @+=expand('%:p')<CR>", "Yank path" },
  }
}, { prefix = "<leader>" })

-- Git
wk.register({
  g = {
    name = "Git",
    g = { "<cmd>Neogit<CR>", "neogit" },
  }
}, { prefix = "<leader>" })

-- Layout
-- TODO: Determine whether layout keys are needed;
wk.register({
  l = {
    name = "Layout",
    e = { vim.diagnostic.open_float, "Error" },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    p = { vim.diagnostic.goto_prev, "Previous diagnostic" },
    n = { vim.diagnostic.goto_next, "Next diagnostic" },
  }
}, { prefix = "<leader>" })

-- Notes
wk.register({
  n = {
    name = "Notes",
    d = {
      name = "Dailies",
      t = { "<cmd>ObsidianToday<CR>", "Today" },
      y = { "<cmd>ObsidianToday -1<CR>", "Yesterday" },
    },
    f = { "<cmd>ObsidianQuickSwitch<CR>", "Find" },
    s = { "<cmd>ObsidianSearch<CR>", "Search" },
    n = { "<cmd>ObsidianNew<CR>", "New" },
    t = { "<cmd>ObsidianTags<CR>", "Tags" },
    T = { "<cmd>ObsidianTemplate<CR>", "Template" },
  }
}, { prefix = "<leader>" })

-- Open
wk.register({
  o = {
    name = "Open",
    p = { "<cmd>Neotree toggle<CR>", "Project" },
    d = { "<cmd>DBUI<CR>", "Database" },
  }
}, { prefix = "<leader>" })

-- Project
wk.register({
  p = {
    name = "Project",
    t = { "<cmd>TodoTelescope<CR>", "Todo" },
  }
}, { prefix = "<leader>" })

-- Quit
wk.register({
  q = {
    name = "Quit",
    q = { "<cmd>q<CR>", "Quit" },
    Q = { "<cmd>q!<CR>", "Force quit" },
    s = { "<cmd>wq<CR>", "Save quit" },
  }
}, { prefix = "<leader>" })

-- Search
wk.register({
  s = {
    name = "Search",
    b = { builtin.buffers, "Buffers" },
    f = { builtin.find_files, "Files" },
    d = { builtin.diagnostic, "Diagnostic" },
    g = { builtin.live_grep, "Grep" },
    h = { builtin.help_tags, "Help" },
    k = { builtin.keymaps, "Keymaps" },
    o = { builtin.oldfiles, "Old" },
    r = { builtin.resume, "Resume" },
    w = { builtin.grep_string, "Word" },
  }
}, { prefix = "<leader>" })

-- Window
wk.register({
  w = {
    name = "Window",
    h = { "<C-w>h", "Move left" },
    j = { "<C-w>j", "Move down" },
    k = { "<C-w>k", "Move up" },
    l = { "<C-w>l", "Move right" },
    s = { "<C-w>s", "Split window" },
    v = { "<C-w>v", "Split window vertically" },
    w = { "<C-w>w", "Switch windows" },
    q = { "<C-w>q", "Quit a window" },
    o = { "<C-w>o", "Close all other windows" },
    T = { "<C-w>T", "Break into new tab" },
    x = { "<C-w>x", "Swap current with next" },
    ["-"] = { "<C-w>-", "Decrease height" },
    ["+"] = { "<C-w>+", "Increase height" },
    ["<lt>"] = { "<C-w><lt>", "Decrease width" },
    [">"] = { "<C-w>>", "Increase width" },
    ["|"] = { "<C-w>x", "Max out width" },
    ["_"] = { "<C-w>x", "Max out height" },
    ["="] = { "<C-w>x", "Equally high and wide" },
  },
}, { prefix = "<leader>" })

