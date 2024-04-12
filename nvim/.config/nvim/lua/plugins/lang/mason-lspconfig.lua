local languages = require("config.languages")

return {
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
}
