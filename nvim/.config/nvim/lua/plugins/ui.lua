return {

  {
    "catppuccin/nvim", -- Pastel colors, balanced between low and high contrast 
    name = "catppuccin",
    priority = 1000,
    init = function()
      vim.cmd.colorscheme "catppuccin"
    end,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        color_overrides = {
          mocha = {
            base = "#000000",
            mante = "#000000",
            crust = "#000000",
          },
        },
      })
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = "hyper",
        config = {
          header = {
            '',
            '',
            '',
            '',
            ' █████╗ ███████╗ ██████╗ ██╗   ██╗ █████╗ ██████╗ ███████╗██████╗     ██╗      █████╗ ██████╗ ███████╗',
            '██╔══██╗██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗    ██║     ██╔══██╗██╔══██╗██╔════╝',
            '╚█████╔╝███████╗██║   ██║██║   ██║███████║██████╔╝█████╗  ██║  ██║    ██║     ███████║██████╔╝███████╗',
            '██╔══██╗╚════██║██║▄▄ ██║██║   ██║██╔══██║██╔══██╗██╔══╝  ██║  ██║    ██║     ██╔══██║██╔══██╗╚════██║',
            '╚█████╔╝███████║╚██████╔╝╚██████╔╝██║  ██║██║  ██║███████╗██████╔╝    ███████╗██║  ██║██████╔╝███████║',
            ' ╚════╝ ╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═════╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝',
            '',
            '',
            '',
            '',
          },

          week_header = {
            enable = true,
          },

          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        }
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

}
