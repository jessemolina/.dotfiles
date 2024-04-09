return {

  {
    "folke/which-key.nvim", -- Display available keybinds per initialized key commands
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local presets = require("which-key.plugins.presets")
      presets.operators["c"] = nil
    end,
    opts = {}
  },

  {
    'nvim-telescope/telescope.nvim', -- Highly extendable fuzzy finder
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            hidden = true
          }
        }
      }
    end
  },

  {
    'nvim-telescope/telescope-ui-select.nvim', -- Set vim ui select to telescope
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }

      })
    end
  },

}
