return {

  {
    "tpope/vim-sleuth", -- Auto detect tabstop and shiftwidth based on file type
  },

  {
    "numToStr/Comment.nvim", -- Comment visual regions and lines
    config = function()
      require("Comment").setup()
    end
  },

  {
    "lewis6991/gitsigns.nvim", -- Add git related signs to the gutter
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  {
    "folke/todo-comments.nvim", -- Todo highlighter and check list
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
    }
  },
}
