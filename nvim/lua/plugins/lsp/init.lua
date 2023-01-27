require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_format_ok, lsp_format = pcall("lsp-format")
if lsp_format_ok then
  lsp_format.setup()
end


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

local language_servers = {
  "tsserver",
  "elixirls",
  "sumneko_lua",
  "jsonls",
  "tailwindcss",
  "prismals",
  "solargraph",
}

for _, language_server in ipairs(language_servers) do
  lspconfig[language_server].setup {
    capabilities = capabilities,
    on_attach = lsp_format.on_attach,
  }
end
