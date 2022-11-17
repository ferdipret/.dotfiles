local M = {}

function M.setup()
  local status_ok, tokyonight = pcall(require, 'tokyonight')
  if not status_ok then
    return
  end

  tokyonight.setup({
    style = "night",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "dark",
      floats = "dark",
    },
    sidebars = { "qf", "help", "terminal", "packer" },
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = true,
  })
end

return M
