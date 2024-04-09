return {

  {
  'tpope/vim-sleuth' -- Auto detect tabstop and shiftwidth based on file type
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "go", "rust", "python", "bash", "markdown" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  }


}
