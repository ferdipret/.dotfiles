local M = {}

function M.setup()
  local null_ls_ok, null_ls = pcall(require, "null-ls")
  local lsp_format_ok, lsp_format = pcall(require, "lsp-format")
  if not null_ls_ok and lsp_format_ok then
    return
  end

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.rubocop,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.code_actions.eslint,
    },
    on_attach = lsp_format.on_attach,
  })
end

return M
