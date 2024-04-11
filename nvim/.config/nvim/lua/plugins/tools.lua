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
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim", -- Highly extendable fuzzy finder
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim", -- Set vim ui select to telescope
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
    end,
  },

  {
    "NeogitOrg/neogit", -- Interactive git interface
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },

  {
    "kristijanhusak/vim-dadbod-ui", -- Database management interface
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "notes",
            path = "~/documents/obsidian/notes",
          },
        },

        disable_frontmatter = false,

        daily_notes = {
          folder = "dailies",
          template = "daily.md",
        },

        templates = {
          subdir = "templates",
          substitutions = {},
        },

        note_frontmatter_func = function(note)
          -- This is equivalent to the default frontmatter function.
          local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }

          -- Remove "daily-notes" tag if it exists
          if note.tags ~= nil then
            for i, tag in ipairs(note.tags) do
              if tag == "daily-notes" then
                table.remove(note.tags, i)
                break
              end
            end
          end

          -- `note.metadata` contains any manually added fields in the frontmatter.
          -- So here we just make sure those fields are kept in the frontmatter.
          if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for k, v in pairs(note.metadata) do
              out[k] = v
            end
          end
          return out
        end,

        note_id_func = function(title)
          -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
          -- In this case a note with the title 'My new note' will be given an ID that looks
          -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
          local suffix = ""
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
          else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return tostring(os.time()) .. "-" .. suffix
        end,
      })
    end,
  },
}
