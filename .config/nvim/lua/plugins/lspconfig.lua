-- Add lsp to config, see configs.lspconfig for the configuration
return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require "configs.lspconfig"
  end,
}
