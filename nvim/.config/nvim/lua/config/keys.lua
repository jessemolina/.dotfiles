local wk = require("which-key")
local builtin = require('telescope.builtin')

-- Buffer
wk.register({
  b = {
    name = "buffer",
    b = {"<cmd>:b#<CR>", "Switch buffer"},
    d = {"<cmd>:bd<CR>", "Kill buffer"},
    f = {builtin.buffers, "find"},
    n = {"<cmd>:bnext<CR>", "Next buffer"},
    p = {"<cmd>:bprevious<CR>", "Previous buffer"},
    R = {"<cmd>:e!<CR>", "Revert buffer"},
    s = {"<cmd>:w<CR>", "Save buffer"},
    w = {"<cmd>:YourWrapCommand<CR>", "Wrap buffer"},
  }
}, {prefix = "<leader>"})

-- Code
wk.register({
  c = {
    name = "code",
    a = {vim.lsp.buf.code_action, "action"},
    f = {"<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "format"},
    D = {builtin.lsp_type_definitions, "type definitions"},
    g = {
      name = "goto",
      I = {builtin.lsp_implementations, "implementation"},
      d = {builtin.lsp_definitions, "definitions"},
      D = {vim.lsp.buf.declaration, "declaration"},
      r = {builtin.lsp_references, "references"},
    },
    k = {vim.lsp.buf.hover, "hover"},
    m = {
      name = "messages",
      e = {vim.diagnostic.open_float, "error"},
      q = {vim.diagnostic.setloclist, "quickfix"},
      p = {vim.diagnostic.goto_prev, "previous diagnostic"},
      n = {vim.diagnostic.goto_next, "next diagnostic"},
    },
    r = {vim.lsp.buf.rename, "rename"},
    s = {
      name = "symbols",
      d = {builtin.lsp_document_symbols, "document"},
      w = {builtin.lsp_dynamic_workspace_symbols, "workspace"},
    },
  }
}, {prefix = "<leader>"})

-- Files
wk.register({
  f = {
    name = "files",
    f = {builtin.find_files, "find"},
    g = {builtin.git_files, "git"},
    n = {":enew<CR>", "new"},
    o = {builtin.oldfiles, "old"},
    s = {":w<CR>", "save"},
    y = {":let @+=expand('%:p')<CR>", "yank path"},
  }
}, {prefix = "<leader>"})

-- Git

-- Layout
wk.register({
  l = {
    name = "layout",
    e = {vim.diagnostic.open_float, "error"},
    q = {vim.diagnostic.setloclist, "quickfix"},
    p = {vim.diagnostic.goto_prev, "previous diagnostic"},
    n = {vim.diagnostic.goto_next, "next diagnostic"},
  }
}, {prefix = "<leader>"})

-- Open
wk.register({
  o = {
    name = "open",
    p = {"<cmd>Neotree toggle<CR>", "project"},
  }
}, {prefix = "<leader>"})

-- Project
wk.register({
  p = {
    name = "project",
    t = {"<cmd>TodoTelescope<CR>", "todo"},
  }
}, {prefix = "<leader>"})


-- Search
wk.register({
  s = {
    name = "search",
    b = {builtin.buffers, "buffers"},
    f = {builtin.find_files, "files"},
    d = {builtin.diagnostic, "diagnostic"},
    g = {builtin.live_grep, "grep"},
    h = {builtin.help_tags, "help"},
    k = {builtin.keymaps, "keymaps"},
    o = {builtin.oldfiles, "old"},
    r = {builtin.resume, "resume"},
    w = {builtin.grep_string, "word"},
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
