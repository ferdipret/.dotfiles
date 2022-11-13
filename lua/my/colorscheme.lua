require("tokyonight").setup({
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

local colorscheme = "tokyonight-night"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  return
end

require('lualine').setup {
  options = {
    section_separators = '',
    component_separators = '',
    theme = 'tokyonight',
  }
}
