local M = {}

function M.setup()
  local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  treesitter_configs.setup({
    ensure_installed = 'all',
    sync_install = false,
    ignore_install = {},
    highlight = {
      enable = true,
      disable = { "txt", "help" },
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    indent = { enable = true },
  })
end

return M
