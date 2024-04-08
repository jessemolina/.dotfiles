local wk = require("which-key")
local builtin = require('telescope.builtin')

-- Buffer
wk.register({
  b = {
    name = "buffer",
    f = {builtin.buffers, "find"},
  }
}, {prefix = "<leader>"})

-- Code
wk.register({
  c = {
    name = "code",
    g = {
      name = "goto",
      i = {builtin.lsp_implementations, "implementation"},
      d = {builtin.lsp_definitions, "definitions"},
      t = {builtin.lsp_type_definitions, "type"},
    }
  }
}, {prefix = "<leader>"})

-- Files
wk.register({
  f = {
    name = "files",
    f = {builtin.find_files, "find"},
    g = {builtin.git_files, "git"},
  }
}, {prefix = "<leader>"})

-- LSP
wk.register({
  l = {
    name = "lsp",
    e = {vim.diagnostic.open_float, "error"},
    q = {vim.diagnostic.setloclist, "quickfix"},
    p = {vim.diagnostic.goto_prev, "previous diagnostic"},
    n = {vim.diagnostic.goto_next, "next diagnostic"},
  }
}, {prefix = "<leader>"})

-- Search
wk.register({
  s = {
    name = "search",
    g = {builtin.grep_string, "grep"},
  }
}, {prefix = "<leader>"})

-- Window
wk.register({
  w = {
    name = "window",
    -- Window movement mappings
    h = {"<C-w>h", "move left"},
    j = {"<C-w>j", "move down"},
    k = {"<C-w>k", "move up"},
    l = {"<C-w>l", "move right"},
    s = {"<C-w>s", "split window"},
    v = {"<C-w>v", "split window vertically"},
    w = {"<C-w>w", "switch windows"},
    q = {"<C-w>q", "quit a window"},
    o = {"<C-w>o", "close all other windows"},
    T = {"<C-w>T", "break into new tab"},
    x = {"<C-w>x", "swap current with next"},
   ["-"] = {"<C-w>-", "decrease height"},
   ["+"] = {"<C-w>+", "increase height"},
   ["<lt>"] = {"<C-w><lt>", "decrease width"},
   [">"] = {"<C-w>>", "increase width"},
   ["|"] = {"<C-w>x", "max out width"},
   ["_"] = {"<C-w>x", "max out height"},
   ["="] = {"<C-w>x", "equally high and wide"},
    -- Add more window mappings here if needed
  },
}, {prefix = "<leader>"})

-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
