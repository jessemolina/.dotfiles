local languages = {
  go = {
    lsp = "gopls",
    formatter = "gofumpt",
    snippets = true
  },

  rust = {
    lsp = "rust_analyzer",
    snippets = true
  },

  lua = {
    lsp = "lua_ls",
    formatter = "stylua",
  },

  python = {
    lsp = "pyright",
    snipets = true
  },

  json = {
    lsp = "jsonls"
  },

  yaml = {
    lsp = "yamlls"
  },

  markdown = {
    lsp = "marksman"
  },

  ansible = {
    lsp = "ansiblels",
    treesitter = false
  },

  terraform = {
    lsp = "terraformls"
  },

}

return {

  {
    "nvim-treesitter/nvim-treesitter", -- Enable enhanced syntax highlighting
    build = ":TSUpdate",
    config = function()
      local ensure_installed = {}
      for lang, config in pairs(languages) do
        if config.treesitter ~= false then
          table.insert(ensure_installed, lang)
        end
      end
      require("nvim-treesitter.configs").setup({
        ensure_installed = ensure_installed,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

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
      for _, config in pairs(languages) do
        if config.lsp then
          table.insert(ensure_installed, config.lsp)
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

      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      for _, config in pairs(languages) do
        if config.lsp then
          require('lspconfig')[config.lsp].setup({})
        end
      end
    end
  },

  {
    "jay-babu/mason-null-ls.nvim", -- Ensure defined formatters installation
    config = function()
      local ensure_installed = {}
      for _, config in pairs(languages) do
        if config.formatter then
          table.insert(ensure_installed, config.formatter)
        end
      end
      require("mason-null-ls").setup({
        ensure_installed = ensure_installed
      })
    end
  },

  {
    "nvimtools/none-ls.nvim", -- Inject LSP diagnostic, code actions, and more
    config = function()
      local null_ls = require("null-ls")
      for _, config in pairs(languages) do
        if config.formatter then
          null_ls.setup({
            sources = {
              null_ls.builtins.formatting[config.formatter]
            }
          })
        end
      end
    end
  },

  {
    'hrsh7th/nvim-cmp',     -- Autocompletion engine
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        mapping = cmp.mapping.preset.insert {
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),

          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-p>'] = cmp.mapping.scroll_docs(4),

          ['<C-y>'] = cmp.mapping.confirm { select = true },

          ['<C-Space>'] = cmp.mapping.complete {},

          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  }

}
