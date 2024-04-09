local languages = {
  go = {
    lsp = "gopls",
    formatter = "gofumpt",
  },

  rust = {
    lsp = "rust_analyzer",
  },

  lua = {
    lsp = "lua_ls",
    formatter = "stylua",
  },
}

return {
  {
    "williamboman/mason.nvim", -- Easily manage and install LSP servers
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim", -- Ensure defined LSP server installation
    config = function()
      local ensure_installed = {}
      for _, lang in pairs(languages) do
        if lang.lsp then
          table.insert(ensure_installed, lang.lsp)
        end
      end
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })
    end
  },

  {
    "neovim/nvim-lspconfig", -- Configure LSP use with neovim
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      for _, lang in pairs(languages) do
        if lang.lsp then
          require('lspconfig')[lang.lsp].setup({})
        end
      end
    end
  },

  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      local ensure_installed = {}
      for _, lang in pairs(languages) do
        if lang.formatter then
          table.insert(ensure_installed, lang.formatter)
        end
      end
      require("mason-null-ls").setup({
        ensure_installed = ensure_installed
      })
    end
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      for _, lang in pairs(languages) do
        if lang.formatter then
          null_ls.setup({
            sources = {
              null_ls.builtins.formatting[lang.formatter]
            }
          })
        end
      end
    end
  },

}
