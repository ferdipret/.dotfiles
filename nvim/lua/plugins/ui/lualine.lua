local M = {}

function M.setup()
  local status_ok, lualine = pcall(require, 'lualine')
  if not status_ok then
    return
  end

  lualine.setup {
    options = {
      section_separators = { left = "", right = "" },
      component_separators = '',
      theme = 'catppuccin',
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_x = { "encoding", "filetype" },
    },
    tabline = {
      lualine_a = {
        {
          "tabs",
          mode = 2,
        },
      },
    },
  }
end

return M
