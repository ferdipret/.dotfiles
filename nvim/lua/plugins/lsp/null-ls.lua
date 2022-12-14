local M = {}

function M.setup()
  local null_ls_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_ok then
    return
  end

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.code_actions.eslint,
    },
    on_attach = require("lsp-format").on_attach,
  })
end

return M
