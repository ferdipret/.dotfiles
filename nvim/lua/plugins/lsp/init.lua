require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single"
  }
)

local language_servers = {
  "tsserver",
  "elixirls",
  "sumneko_lua",
  "jsonls",
  "tailwindcss",
}

for _, language_server in ipairs(language_servers) do
  lspconfig[language_server].setup {
    capabilities = capabilities
  }
end
