return {
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
}
